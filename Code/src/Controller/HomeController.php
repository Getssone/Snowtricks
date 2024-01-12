<?php

namespace App\Controller;

use App\Repository\ArticleRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Tools\Pagination\Paginator;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HomeController extends AbstractController
{
    #[Route('/{page}', name: 'app_home', requirements: ['page' => '\d+'], defaults: ['page' => 1])]
    public function index(ArticleRepository $articleRepository, int $page = 1): Response
    {
        $pageSize = 10; // Nombre d'articles par page
        $queryArticles = $articleRepository->createQueryBuilder('a')
            ->orderBy('a.createdAt', 'DESC')
            ->getQuery();

        // dd($queryArticles);
        $articlesPaginer = new Paginator($queryArticles);
        // dd($articlesPaginer);
        $articlesPaginer->getQuery()
            ->setFirstResult($pageSize * ($page - 1)) // Définir l'offset
            ->setMaxResults($pageSize); // Limiter le nombre de résultats

        // $verificationArticles = []; // Création d'un tableau vide

        // foreach ($articlesPaginer as $article) {
        //     // Ajouter le nom de chaque article au tableau
        //     $verificationArticles[] = $article;
        // }

        // dd($verificationArticles); // Afficher le tableau des noms des articles

        $totalArticles = count($articlesPaginer);
        $totalPages = ceil($totalArticles / $pageSize);


        return $this->render('pages/home.html.twig', [
            'articles' => $articlesPaginer,
            'currentPage' => $page,
            'totalPages' => $totalPages
        ]);
    }
}
