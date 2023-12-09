<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Image;
use App\Entity\Article;
use App\Form\ArticleType;
use App\Repository\ArticleRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
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

    #[Route('/', name: 'app_article_index', methods: ['GET'])]
    public function index(ArticleRepository $articleRepository): Response
    {
        // return $this->render('pages/home.html.twig', [
        //     'articles' => $articleRepository->findAll(),
        // ]);
        return $this->render('article/index.html.twig', [
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
        if ($form->isSubmitted() && $form->isValid()) {
            // Gérez le téléchargement et la persistance des images ici
            $uploadedImages = $form->get('images')->getData();
            foreach ($uploadedImages as $uploadedImage) {
                $image = new Image();

                // Obtenez le nom du fichier d'origine
                $originalFilename = $uploadedImage->getClientOriginalName();

                // Générez un nom de fichier unique pour éviter les conflits
                // $newFilename = md5(uniqid()) . '.' . $uploadedImage->guessExtension();
                $newFilename = uniqid() . '-' . $originalFilename;


                // Déplacez le fichier téléchargé vers un répertoire de stockage
                try {
                    $uploadedImage->move($this->getParameter('upload_directory'), $newFilename);
                } catch (FileException $e) {
                    // Gestion des erreurs si le déplacement du fichier échoue
                    // Vous pouvez personnaliser cette partie en fonction de vos besoins
                    print($e);
                }

                // Enregistrez le nom du fichier original dans la propriété "name" de votre entité Image
                $image->setName($originalFilename);

                // Enregistrez le nom du fichier généré dans la propriété "filename" de votre entité Image
                $image->setFile($newFilename);

                // Ajoutez l'image à l'article
                $article->addImage($image);
            }
            // dd($article);
            $entityManager->persist($article);
            $entityManager->flush();

            return $this->redirectToRoute('app_article_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('article/new.html.twig', [
            'article' => $article,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_article_show', methods: ['GET'])]
    public function show(Article $article): Response
    {
        return $this->render('article/show.html.twig', [
            'article' => $article,
        ]);
    }
    #[IsGranted('ROLE_USER')]
    #[Route('/{id}/edit', name: 'app_article_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Article $article, EntityManagerInterface $entityManager): Response
    {
        // Récupérer l'utilisateur actuel
        $token = $this->tokenStorage->getToken();
        $user = $token->getUser();

        // Vérifier si l'utilisateur est l'auteur de l'article
        if ($user !== $article->getAuthor()) {
            // Refuser l'accès
            $this->addFlash('danger', "Vous n'êtes pas autorisé à modifier cet article.");
            return $this->redirectToRoute('app_article_index');
        } {
            $form = $this->createForm(ArticleType::class, $article);
            $form->handleRequest($request);
            if ($article) {
                $article->getAuthor()->getUsername();
            }

            if ($form->isSubmitted() && $form->isValid()) {
                $entityManager->flush();

                return $this->redirectToRoute('app_article_index', [], Response::HTTP_SEE_OTHER);
            }

            return $this->render('article/edit.html.twig', [
                'article' => $article,
                'form' => $form,
            ]);
        }
    }
    #[IsGranted('ROLE_USER')]
    #[Route('/{id}', name: 'app_article_delete', methods: ['POST'])]
    public function delete(Request $request, Article $article, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete' . $article->getId(), $request->request->get('_token'))) {
            $entityManager->remove($article);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_article_index', [], Response::HTTP_SEE_OTHER);
    }
}
