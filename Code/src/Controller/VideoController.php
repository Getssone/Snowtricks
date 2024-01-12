<?php

namespace App\Controller;

use App\Entity\Video;
use App\Entity\Article;
use App\Form\VideoType;
use App\Repository\VideoRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

#[Route('/video')]
class VideoController extends AbstractController
{
    private function videoAlreadyExists(Article $article, string $filename): bool
    {
        foreach ($article->getVideos() as $video) {
            if ($video->getLink() === $filename) {
                return true;
            }
        }
        return false;
    }


    #[Route('/', name: 'app_video_index', methods: ['GET'])]
    public function index(VideoRepository $videoRepository): Response
    {
        return $this->render('video/index.html.twig', [
            'videos' => $videoRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_video_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $video = new Video();
        $form = $this->createForm(VideoType::class, $video);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($video);
            $entityManager->flush();

            return $this->redirectToRoute('app_video_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('video/new.html.twig', [
            'video' => $video,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_video_show', methods: ['GET'])]
    public function show(Video $video): Response
    {
        return $this->render('video/show.html.twig', [
            'video' => $video,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_video_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Video $video, EntityManagerInterface $entityManager): Response
    {
        $oldVideo = $video->getLink();
        $form = $this->createForm(VideoType::class, $video);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $uploadedVideo = $form->get('link')->getData();
            if ($uploadedVideo !== null) {
                // Récupérez l'article associé à l'image
                $article = $video->getArticle();

                if (!$this->videoAlreadyExists($article, $uploadedVideo)) {
                    try {
                        $uploadedVideo->move($this->getParameter('upload_directory'), $uploadedVideo);
                        $video->setLink($uploadedVideo);
                    } catch (FileException $e) {
                    }
                    $video->setLink($oldVideo);
                }
            }
            $entityManager->flush();

            $articleSlug = $article->getSlug();
            return $this->redirectToRoute('app_article_show', ['slug' => $articleSlug], Response::HTTP_SEE_OTHER);
        }

        return $this->render('video/edit.html.twig', [
            'video' => $video,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_video_delete', methods: ['POST'])]
    public function delete(Request $request, Video $video, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete' . $video->getId(), $request->request->get('_token'))) {
            $entityManager->remove($video);
            $entityManager->flush();
        }

        $article = $video->getArticle();
        $articleSlug = $article->getSlug();
        return $this->redirectToRoute('app_article_show', ['slug' => $articleSlug], Response::HTTP_SEE_OTHER);
    }
}
