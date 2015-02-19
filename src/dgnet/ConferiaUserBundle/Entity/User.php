<?php

namespace dgnet\ConferiaUserBundle\Entity;

use FOS\UserBundle\Model\User as BaseUser;
use Doctrine\ORM\Mapping as ORM;

/**
 * Class User
 * @package dgnet\ConferiaUserBundle\Entity
 * @ORM\Entity
 * @ORM\Table
 */
class User extends BaseUser {

    /**
     * @ORM\Id
     * @ORM\Column(type="integer",name="userid")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $userid;

    public function __construct()
    {
        parent::__construct();
    }
}
