<?php

namespace App\Controller\Account;

use App\Entity\Address;
use App\Form\AddressType;
use App\Repository\AddressRepository;
use App\Services\CartServices;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/address")
 */
class AddressController extends AbstractController
{
   /**
 * @Route("/", name="app_address_index", methods={"GET"})
 */
public function index(AddressRepository $addressRepository): Response
{
    $user = $this->getUser();

    $addresses = $addressRepository->findBy(['user' => $user]);

    return $this->render('address/index.html.twig', [
        'addresses' => $addresses,
    ]);
}

    /**
     * @Route("/new", name="app_address_new", methods={"GET", "POST"})
     */
    public function new(CartServices $cartServices, Request $request, AddressRepository $addressRepository): Response
    {
        $address = new Address();
        $form = $this->createForm(AddressType::class, $address);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $user = $this->getUser();
            $address->setUser($user);
            
            $addressRepository->add($address, true);

            // if ($cartServices->getFullCart()) {
            //     return $this->redirectToRoute('app_checkout');
            // }

            return $this->redirectToRoute('app_account');
        }

        return $this->renderForm('address/new.html.twig', [
            'address' => $address,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="app_address_show", methods={"GET"})
     */
    public function show(Address $address): Response
    {
        return $this->render('address/show.html.twig', [
            'address' => $address,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="app_address_edit", methods={"GET", "POST"})
     */
    public function edit(Request $request, Address $address, AddressRepository $addressRepository): Response
    {
        $form = $this->createForm(AddressType::class, $address);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $addressRepository->add($address, true);

            return $this->redirectToRoute('app_address_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('address/edit.html.twig', [
            'address' => $address,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="app_address_delete", methods={"POST"})
     */
    public function delete(Request $request, Address $address, AddressRepository $addressRepository): Response
    {
        if ($this->isCsrfTokenValid('delete' . $address->getId(), $request->request->get('_token'))) {
            $addressRepository->remove($address, true);
        }

        return $this->redirectToRoute('app_address_index', [], Response::HTTP_SEE_OTHER);
    }
}
