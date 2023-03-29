<?php

namespace App\Services;

use App\Repository\ProductRepository;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class CartServices
{
    private $session;
    private $repoProduct;

    public function __construct(ProductRepository $repoProduct, SessionInterface $session)
    {
        $this->session = $session;
        $this->repoProduct = $repoProduct;
    }

    /** ajout d'un produit au panier */
    public function addToCart($id)
    {
        $cart = $this->getCart();
        if (isset($cart[$id])) {
            $cart[$id]++;
        } else {
            $cart[$id] = 1;
        }
        $this->updateCart($cart);
    }

    /** suppression d'un produit du panier */
    public function deleteFromCart($id)
    {
        $cart = $this->getCart();

        if (isset($cart[$id])) {
            if ($cart[$id] > 1) {
                $cart[$id]--;
            } else {
                unset($cart[$id]);
            }
            $this->updateCart($cart);
        }
    }

    /** suppression de toutes les quantités d'un produit */
    public function deleteAllToCart($id)
    {
        $cart = $this->getCart();

        unset($cart[$id]);
        $this->updateCart($cart);
    }

    /** suppression de tout le panier */
    public function deleteCart()
    {
        $this->updateCart([]);
    }

    /** mise à jour du panier */
    public function updateCart($cart)
    {
        $this->session->set('cart', $cart);
    }

    /** récupérer le panier, retourner son contenu */
    public function getCart()
    {
        return $this->session->get('cart', []);
    }

    public function getFullCart()
    {
        $cart = $this->getCart();

        $fullCart = [];
        foreach ($cart as $id => $quantity) {
            $product = $this->repoProduct->find($id);
            if ($product) {
                $fullCart[] =
                    [
                        'quantity' => $quantity,
                        "product" => $product,
                    ];
            } else {
                $this->deleteFromCart($id);
            }
        }
        return $fullCart;
    }
}
