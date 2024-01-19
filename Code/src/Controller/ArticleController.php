<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Image;
use App\Entity\Article;
use App\Entity\Comment;
use App\Form\ArticleType;
use App\Form\CommentType;
use App\Repository\ArticleRepository;
use App\Repository\CommentRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Tools\Pagination\Paginator;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
// use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;

#[Route('/article')]
class ArticleController extends AbstractController
{
    private $tokenStorage;

    public function __construct(TokenStorageInterface $tokenStorage)
    {
        $this->tokenStorage = $tokenStorage;
    }
    private function mainImageAlreadyExists(Article $article, string $filename): bool
    {
        return $article->getMainImageName() === $filename;
    }
    private   function imageAlreadyExists(Article $article, string $filename): bool
    {
        foreach ($article->getImages() as $image) {
            if ($image->getFile() === $filename) {
                return true;
            }
        }
        return false;
    }
    function verificationForm($form, Article $article)
    {

        $uploadedMainImage = $form->get('mainImageName')->getData();
        if ($uploadedMainImage !== null) {
            // Obtenez le nom du fichier d'origine
            $originalMainImageFilename = $uploadedMainImage->getClientOriginalName();

            if (!$this->mainImageAlreadyExists($article, $originalMainImageFilename)) {
                // Déplacez le fichier téléchargé vers un répertoire de stockage
                try {
                    $uploadedMainImage->move($this->getParameter('upload_directory'), $originalMainImageFilename);
                } catch (FileException $e) {
                    $this->addFlash('warning', "le déplacement du fichier échoue.");
                }

                // Affectez le nom du fichier généré à la propriété "mainImageName" de l'entité Article
                $article->setMainImageName($originalMainImageFilename);
            }
        } else {
            // Aucun fichier n'est téléchargé, donc conservez l'image principale existante
            $defaultImagePath = 'composition-point-interrogation-paysage-naturel_23-2150525235.jpg';
            $article->setMainImageName($defaultImagePath);
        }
        $uploadedImages = $form->get('images')->getData();
        // Gestion des téléchargements des images $uploadedImages=$form->get('images')->getData();
        foreach ($uploadedImages as $uploadedImage) {
            // Obtenez le nom du fichier d'origine
            $originalFilename = $uploadedImage->getClientOriginalName();

            // Générez un nom de fichier unique pour éviter les conflits
            $newFilename = uniqid() . '-' . $originalFilename;

            // Vérifiez si l'image existe déjà pour cet article
            if (!$this->imageAlreadyExists($article, $newFilename)) {
                $image = new Image();

                // Déplacez le fichier téléchargé vers un répertoire de stockage
                try {
                    $uploadedImage->move($this->getParameter('upload_directory'), $newFilename);
                } catch (FileException $e) {
                    $this->addFlash('warning', "le déplacement du fichier échoue.");
                }

                // Enregistrez les informations de l'image dans l'entité Image
                $image->setName($originalFilename);
                $image->setFile($newFilename);

                // Ajoutez l'image à l'article
                $article->addImage($image);
            }
        }


        // Gestion des téléchargements vidéos
        $videos = $form->get('videos')->getData();
        foreach ($videos as $video) {
            $video->setArticle($article);
        }
    }


    #[Route('/', name: 'app_article_index', methods: ['GET'])]
    public function index(ArticleRepository $articleRepository): Response
    {
        return $this->render('pages/home.html.twig', [
            'articles' => $articleRepository->findAll(),
        ]);
    }
    #[IsGranted('ROLE_USER')]
    #[Route('/new', name: 'app_article_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $article = new Article();
        $token = $this->tokenStorage->getToken();

        if ($token) {
            $user = $token->getUser();

            if ($user instanceof User) {
                $article->setAuthor($user);
            }
        }
        $form = $this->createForm(ArticleType::class, $article);
        $form->handleRequest($request);

        //     //INFO : 
        //     // lorsque on utilise le champ FileType::class dans Symfony pour gérer le téléchargement de fichiers, il est automatiquement associé à la classe Symfony\Component\HttpFoundation\File\UploadedFile. Cette classe est utilisée pour représenter les fichiers téléchargés via un formulaire Symfony.

        if ($form->isSubmitted() && $form->isValid()) {
            // Gestion des téléchargements de l'image principal

            $this->verificationForm($form, $article);

            // Gestion de l'enregistrement dans la Bdd 
            $entityManager->persist($article);
            $entityManager->flush();

            $this->addFlash('success', "l'article à bien été crée.");
            return $this->redirectToRoute('app_home', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('article/new.html.twig', [
            'article' => $article,
            'form' => $form,
        ]);
    }

    #[Route('/{slug}', name: 'app_article_show', methods: ['GET', 'POST'])]
    public function show(Request $request, CommentRepository $commentRepository, EntityManagerInterface $entityManager, string $slug,): Response
    {
        // Recherchez l'article par slug
        $article = $entityManager->getRepository(Article::class)->findOneBy(['slug' => $slug]);

        // Si aucun article n'est trouvé, renvoyez une page 404
        if (!$article) {
            $this->addFlash('warning', "Cet article n'existe pas.");
            return $this->redirectToRoute('app_home');
        }

        $comment = new Comment();
        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);
        $token = $this->tokenStorage->getToken();

        if ($token) {
            $user = $token->getUser();

            if ($user instanceof User) {
                $comment->setAuthor($user);
            }
        }
        $comment->setArticle($article);
        $articleSlug = $article->getSlug();
        if ($form->isSubmitted()) {
            if ($form->isValid()) {
                $entityManager->persist($comment);
                $entityManager->flush();
                $this->addFlash('success', "Votre commentaire à bien été enregistré.");
                return $this->redirectToRoute('app_article_show',  ['slug' => $articleSlug], Response::HTTP_SEE_OTHER);
            } else {
                $this->addFlash('warning', "Votre commentaire aucun message laissé.");
            }
        }
        // Définir la pagination
        $pageSize = 6; // Nombre de commentaires par page
        $currentPage = $request->query->get('page', 1);

        $queryComments = $commentRepository->createQueryBuilder('c')
            ->where('c.article = :article')
            ->setParameter('article', $article)
            ->orderBy('c.createdAt', 'DESC')
            ->getQuery();

        $commentsPaginer = new Paginator($queryComments);
        $commentsPaginer->getQuery()
            ->setFirstResult($pageSize * ($currentPage - 1))
            ->setMaxResults($pageSize);


        // Calculez le nombre total de pages
        $totalComments = count($commentsPaginer);
        $totalPages = ceil($totalComments / $pageSize);

        return $this->render('article/show.html.twig', [
            'article' => $article,
            'commentaires' => $commentsPaginer,
            'totalPages' => $totalPages,
            'currentPage' => $currentPage,
            'form' => $form,
            'slug' => $articleSlug
        ]);
    }

    #[IsGranted('ROLE_USER')]
    #[Route('/{slug}/edit', name: 'app_article_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Article $article, EntityManagerInterface $entityManager): Response
    {
        // Récupérer l'utilisateur actuel
        $token = $this->tokenStorage->getToken();
        $user = $token->getUser();
        $oldImage = $article->getMainImageName();
        $oldName = $article->getName();
        // Recherchez l'article par slug

        // Vérifier si l'utilisateur est l'auteur de l'article

        if ($user !== $article->getAuthor()) {
            $this->addFlash('danger', "Vous n'êtes pas autorisé à modifier cet article.");
            return $this->redirectToRoute('app_article_edit', ["slug" => $article->getSlug()]);
        }
        $form = $this->createForm(ArticleType::class, $article);
        $form->handleRequest($request);
        if ($article) {
            $article->getAuthor()->getUsername();
        }
        $existingArticle = $entityManager->getRepository(Article::class)->findOneBy([
            'name' => $article->getName(),
        ]);
        if ($form->isSubmitted()) {

            if ($existingArticle ===  null || $existingArticle->getId() ===  $article->getId()) {

                $this->verificationForm($form, $article);
                $uploadedMainImage = $form->get('mainImageName')->getData();
                // dd($uploadedMainImage->getClientOriginalName());
                if ($uploadedMainImage ===  null || $uploadedMainImage !==  null && $uploadedMainImage->getClientOriginalName() ===  "composition-point-interrogation-paysage-naturel_23-2150525235") {
                    $article->setMainImageName($oldImage);
                }


                $article->updateTimestamps();
                // Gestion de l'enregistrement dans la Bdd 
                $entityManager->persist($article);
                $entityManager->flush();

                $this->addFlash('success', "L'article à bien été modifié.");

                return $this->redirectToRoute('app_home');
            } else {
                $article->setMainImageName($oldImage);
                $article->setName($oldName);
                $this->addFlash('warning', "Un autre article possède déjà ce nom.");
                return $this->redirectToRoute('app_article_edit', ["slug" => $article->getSlug()]);
            }
        }
        return $this->render('article/edit2.html.twig', [
            'article' => $article,
            'form' => $form,
        ]);
    }

    #[IsGranted('ROLE_USER')]
    #[Route('/{slug}/deleted', name: 'app_article_delete')]
    public function delete(Request $request, Article $article, EntityManagerInterface $entityManager): Response
    {

        if ($this->isCsrfTokenValid('delete' . $article->getId(), $request->request->get('_token'))) {
            $this->addFlash('warning', "L'article à bien été supprimé.");
            $entityManager->remove($article);
            $entityManager->flush();
            return $this->redirectToRoute('app_home');
        }

        return $this->redirectToRoute('app_home');
    }
}
