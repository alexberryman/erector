<?php


use Phinx\Seed\AbstractSeed;

class CookieSeeder extends AbstractSeed
{
    const TYPE = 'type';
    const DELICIOUS = 'delicious';

    public function run()
    {
        $data = [
            [
                self::TYPE => 'Oatmeal raisin',
                self::DELICIOUS => true,
            ],
            [
                self::TYPE => 'Peanut butter',
                self::DELICIOUS => true,
            ],
            [
                self::TYPE => 'Chocolate chip',
                self::DELICIOUS => true,
            ],
            [
                self::TYPE => 'Sugar',
                self::DELICIOUS => false,
            ],
        ];

        $posts = $this->table('cookies');
        $posts->insert($data)
            ->save();
    }
}
