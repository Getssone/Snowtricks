<?php

namespace App\Controller;

use App\Entity\Image;
use App\Entity\Article;
use App\Form\ImageType;
use App\Repository\ImageRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\File\UploadedFile;

#[Route('/image')]
class ImageController extends AbstractController
{
    private function imageAlreadyExists(Article $article, string $filename): bool
    {
        foreach ($article->getImages() as $image) {
            if ($image->getFile() === $filename) {
                return true;
            }
        }
        return false;
    }

    #[Route('/', name: 'app_image_index', methods: ['GET'])]
    public function index(ImageRepository $imageRepository): Response
    {
        return $this->render('image/index.html.twig', [
            'images' => $imageRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_image_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $image = new Image();
        $form = $this->createForm(ImageType::class, $image);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($image);
            $entityManager->flush();

            return $this->redirectToRoute('app_image_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('image/new.html.twig', [
            'image' => $image,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_image_show', methods: ['GET'])]
    public function show(Image $image): Response
    {
        return $this->render('image/show.html.twig', [
            'image' => $image,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_image_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Image $image, EntityManagerInterface $entityManager): Response
    {
        $oldImage = $image->getFile();
        $form = $this->createForm(ImageType::class, $image);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $uploadedImage = $form->get('image')->getData();
            if ($uploadedImage !== null) {
                // Obtenez le nom du fichier d'origine
                $originalUploadedImageFilename = $uploadedImage->getClientOriginalName();
                // Récupérez l'article associé à l'image
                $article = $image->getArticle();

                if (!$this->imageAlreadyExists($article, $originalUploadedImageFilename)) {
                    try {
                        $uploadedImage->move($this->getParameter('upload_directory'), $originalUploadedImageFilename);
                        $image->setFile($originalUploadedImageFilename);
                    } catch (FileException $e) {
                    }
                    $image->setFile($originalUploadedImageFilename);
                }
            }

            $entityManager->flush();
            $articleSlug = $article->getSlug();
            return $this->redirectToRoute('app_article_show', ['slug' => $articleSlug], Response::HTTP_SEE_OTHER);
        }

        return $this->render('image/edit.html.twig', [
            'image' => $image,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_image_delete', methods: ['POST'])]
    public function delete(Request $request, Image $image, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete' . $image->getId(), $request->request->get('_token'))) {
            $entityManager->remove($image);
            $entityManager->flush();
        }
        $article = $image->getArticle();
        $articleSlug = $article->getSlug();
        return $this->redirectToRoute('app_article_show', ['slug' => $articleSlug], Response::HTTP_SEE_OTHER);
    }
}
