<?php

namespace App\Controller;

use App\Form\CheckoutType;
use App\Services\CartServices;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;

class CheckoutController extends AbstractController
{
    private $cartServices;

    public function __construct(CartServices $cartServices)
    {
        $this->cartServices = $cartServices;
    }

    /**
     * @Route("/checkout", name="app_checkout")
     */
    public function index(Request $request): Response
    {
        $user = $this->getUser();

        $cart = $this->cartServices->getFullCart();

        if (!$cart) {
            return $this->redirectToRoute('app_home');
        }
        if (!$user->getAddresses()->getValues()) {
            $this->addFlash('checkout_message', 'Veuillez ajouter une adresse à votre compte pour pouvoir continuer.');
            return $this->redirectToRoute('app_address_new');
        }

        $form = $this->createForm(CheckoutType::class, null, ['user' => $user]);
        $form->handleRequest($request);

        // if ($form->isSubmitted() && $form->isValid()) {
        //     $user = $this->getUser();

        //     return $this->redirectToRoute('app_home');
        // }

        return $this->render('checkout/index.html.twig', [
            'cart' => $cart,
            'checkout' => $form->createView(),
        ]);
    }
}
