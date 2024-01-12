<?php

namespace App\EventListener;

use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpKernel\Event\ExceptionEvent;
use Symfony\Component\Routing\RouterInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class Redirect404ToHomepageListener
{
    private $router;

    public function __construct(RouterInterface $router)
    {
        $this->router = $router;
    }

    public function onKernelException(ExceptionEvent $event)
    {
        // Récupère l'exception
        $exception = $event->getThrowable();

        // Vérifie si c'est une erreur 404
        if ($exception instanceof NotFoundHttpException) {
            // Crée une réponse de redirection
            $response = new RedirectResponse($this->router->generate('app_home'));
            // Envoie la réponse
            $event->setResponse($response);
        }
    }
}
