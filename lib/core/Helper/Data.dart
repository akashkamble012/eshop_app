// Modul Fruits

import 'package:eshop/features/product/domain/entities/fruit.dart';

var product = <Fruits>[
  Fruits(
    name: 'Banana',
    description:
        'A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large',
    id: DateTime.now().toIso8601String(),
    price: 82.50,
    offer: 20,
    unit: '1kg',
    aboutTheProduct: [
      'Tiny and small sized, this variety is called Yelakki in Bangalore and Elaichi in Mumbai',
      'Despite its small size, they are naturally flavoured, aromatic and sweeter compared to regular bananas.'
    ],
    benefits: [
      'One banana supplies 30 percent of the daily vitamin B6 requirement and is rich in vitamin C, potassium and fiber.',
      'It reduces appetite and promotes weight loss, while also boosting the immune system and keeping the bones strong'
    ],
    storageAndUses: [
      'Store them in a cool, dry place away from direct sunlight. Fresh, raw yelakkis are green'
    ],
    images: [
      'https://www.bigbasket.com/media/uploads/p/s/10000031-2_3-fresho-banana-yelakki.jpg',
      'https://www.bigbasket.com/media/uploads/p/s/10000031-4_2-fresho-banana-yelakki.jpg',
      'https://www.bigbasket.com/media/uploads/p/s/10000031-5_1-fresho-banana-yelakki.jpg',
    ],
    imageUrl:
        'https://www.bigbasket.com/media/uploads/p/s/10000031-2_3-fresho-banana-yelakki.jpg',
  ),
  Fruits(
    name: 'Fresho Papaya',
    description:
        'Semi ripe papayas have blend of sweet buttery consistency and sour taste.',
    id: DateTime.now().toIso8601String(),
    price: 48,
    offer: 38,
    unit: '1pc',
    aboutTheProduct: [
      'Semi ripe papayas have blend of sweet buttery consistency and sour taste. They are half green and half yellow.',
      'Ripe papaya have orange flesh and black coloured seeds at the centre.'
    ],
    benefits: [
      'Papaya contain Folic acid, Vitamin C, Amino Acid.Papayas reduce the risk of macular degeneration, a disease that affects the eyes as people age.',
      'It can controls Diabetes, Blood Pressure, reduces the risk of Heart disease. They prevent asthma and cancer.'
          'It control Mashed papayas help in wound healing and preventing infections'
    ],
    storageAndUses: [
      'Semi ripe papaya will be ripened furthur if stored at room temperature.'
    ],
    images: [
      'https://www.bigbasket.com/media/uploads/p/l/10000152-3_5-fresho-papaya-medium.jpg',
      'https://www.bigbasket.com/media/uploads/p/l/10000152_19-fresho-papaya-medium.jpg',
    ],
    imageUrl:
        'https://www.bigbasket.com/media/uploads/p/l/10000152-2_36-fresho-papaya-medium.jpg',
  ),
  Fruits(
    name: 'Apple - Shimla',
    description: 'Fresho Apple - Red Delicious, Regular',
    id: DateTime.now().toIso8601String(),
    price: 102,
    offer: 20,
    unit: 'Approx. 500g- 650g',
    aboutTheProduct: [
      'Considered as most commonly grown apples in India, Shimla apples have a light red skin, juicy and crunchy flesh.',
      'We source the best apples with residue and wax free peel from the trusted growers.'
    ],
    benefits: [
      'Apples are one of the healthiest fruits. Rich in vitamin C and dietary fiber which keep our digestive and immune system healthy. ',
      'Protects from Alzheimers, type 2 diabetes and cancer. It is a natural teeth whitener and prevent bad breath.',
      'Eating apple peel lowers the risk of obesity. Apple mask is an excellent cure for wrinkles',
    ],
    storageAndUses: [
      'Store them in a cool, dry place away from direct sunlight.',
      'Wrap them with newspaper individually to keep them fresh for a long time. If any apple goes bad, it protects other apples from getting spoiled.',
      'Take a cup of water, dissolve 1/8th teaspoon of salt in it.Soak freshly cut slices and drain them. Now, rinse them in fresh water so that they will not taste salty',
    ],
    images: [
      'https://www.bigbasket.com/media/uploads/p/l/10000005-2_1-fresho-apple-royal-gala-economy.jpg',
      'https://www.bigbasket.com/media/uploads/p/l/40033823-2_1-fresho-apple-royal-gala-regular.jpg',
      'https://www.bigbasket.com/media/uploads/p/l/40033823-2_1-fresho-apple-royal-gala-regular.jpg',
    ],
    imageUrl:
        'https://www.bigbasket.com/media/uploads/p/l/40033819-2_6-fresho-apple-shimla.jpg',
  ),
  Fruits(
    name: 'Pomegranate',
    description:
        'With ruby color and an intense floral, sweet-tart flavor, the pomegranate delivers both taste and beauty.',
    id: DateTime.now().toIso8601String(),
    price: 206,
    offer: 34,
    unit: '4pc',
    aboutTheProduct: [
      'With ruby color and an intense floral, sweet-tart flavor, the pomegranate delivers both taste and beauty..',
      'Red Delicious Apples are a natural source of fibre and are fat free. They contain a wide variety of anti-oxidants and polynutrients',
      'You can remove the skin and the membranes to get at the delicious fruit with nutty seeds.',
    ],
    benefits: [
      'Pomegranate is a rich supplier of soluble and insoluble dietary fibers, vitamin K, C, minerals and B-complex vitamins such as B5, B6',
      'Pomegranate juice lowers bad cholesterol and raises good cholesterol.Reduces the risk of heart stoke.',
      'Gives a boost of energy and freshness. So, this is specially recommended for women during menopause. Good for pregnant women as it prevents brain damage in infants.',
    ],
    storageAndUses: [
      'Store in a cool and dry place.Whole fruit can be refrigirated upto 2 months. Fresh seeds and juice can be refrigerated for upto 5 days',
      'Eat the juicy seeds raw or add into salads, garnishes or desserts. Enjoy the fresh pomegranate juice by blending them.',
    ],
    images: [
      'https://www.bigbasket.com/media/uploads/p/l/10000269-4_2-fresho-pomegranate.jpg',
      'https://www.bigbasket.com/media/uploads/p/l/10000269-2_2-fresho-pomegranate.jpg',
      'https://www.bigbasket.com/media/uploads/p/l/10000269-2_2-fresho-pomegranate.jpg',
    ],
    imageUrl:
        'https://www.bigbasket.com/media/uploads/p/l/10000269-2_2-fresho-pomegranate.jpg',
  ),
  Fruits(
    name: 'Muskmelon - Striped',
    description:
        'Fresho striped muskmelons have a distinct external skin that is smooth',
    id: DateTime.now().toIso8601String(),
    price: 42,
    offer: 5,
    unit: '1pc',
    aboutTheProduct: [
      'Fresho striped muskmelons have a distinct external skin that is smooth',
      'green ribbing on pistachio-grey colored surface. Their flesh is orange coloured, sweet with a floral aroma. Fresho muskmelons are directly procured from our farmers',
    ],
    benefits: [
      'Muskmelons have cooling properties. They are good for skin and help in weight loss. Also cures constipation, bladder infections and fatigue',
      'Folic acid, which is essential for pregnant women to prevent natural defects in the foetus is abundantly present in musk melon.',
      'Good source of vitamin C, potassium and dietary fiber.',
    ],
    storageAndUses: [
      'Store them in a cool, dry place away from direct sunlight. Cut and serve chilled muskmelons',
      'Muskmelons can be eaten fresh. They are used in making fruit salads, custard, milkshakes, juices and lassi.Mix, chop or mash muskmelons with sugar and cardamom powder.',
    ],
    images: [
      'https://www.bigbasket.com/media/uploads/p/l/40073761-2_1-fresho-muskmelon-striped.jpg',
      'https://www.bigbasket.com/media/uploads/p/l/40073761-2_1-fresho-muskmelon-striped.jpg',
      'https://www.bigbasket.com/media/uploads/p/l/40073761-2_1-fresho-muskmelon-striped.jpg',
    ],
    imageUrl:
        'https://www.bigbasket.com/media/uploads/p/l/40073761-2_1-fresho-muskmelon-striped.jpg',
  ),
  Fruits(
    name: 'Dasheri Mango',
    description:
        'Grown in different parts of Northern India, Dasheri mango is elongated in shape and with a yellow or greenish coloured skin and a sweet yellow pulp.',
    id: DateTime.now().toIso8601String(),
    price: 83,
    offer: 5,
    unit: '1kg',
    aboutTheProduct: [
      'Grown in different parts of Northern India, Dasheri mango is elongated in shape and with a yellow or greenish coloured skin and a sweet yellow pulp.',
      'The juicy flesh of this mango is fibreless and is delicious in taste.'
    ],
    benefits: [
      'It is high in dietary fibre and is filled with antioxidants, vitamins and minerals.',
      'It is a good source of vitamin A, C and Potassium.Mango improves digestion, eye health, skin and lowers cholesterol',
    ],
    storageAndUses: [
      'Store mangoes at room temperature.',
      'Dasheri mango is relished in every form - have it in slices, blend pulp into yummy smoothies, dice and add to fruit salads or use as a topping on your ice cream.',
    ],
    images: [
      'https://www.bigbasket.com/media/uploads/p/l/30001003-2_2-fresho-dasheri-mango.jpg',
      'https://www.bigbasket.com/media/uploads/p/s/30001003-3_2-fresho-dasheri-mango.jpg',
      'https://www.bigbasket.com/media/uploads/p/l/30001003-2_2-fresho-dasheri-mango.jpg',
    ],
    imageUrl:
        'https://www.bigbasket.com/media/uploads/p/l/30001003_3-fresho-dasheri-mango.jpg',
  ),
  Fruits(
    name: 'Pears - Babbugosha,',
    description:
        'Pears Babbugosha have a white, grainy, crisp and crunchy flesh with a rich sweetness that is very different from the common pear flavour.',
    id: DateTime.now().toIso8601String(),
    price: 123.75,
    offer: 5,
    unit: '1kg',
    aboutTheProduct: [
      'Pears Babbugosha have a white, grainy, crisp and crunchy flesh with a rich sweetness that is very different from the common pear flavour. Fresho pears are organically grown, juicy and of high quality that are',
      'selectively picked from the best farms.'
    ],
    benefits: [
      'Pears Babbugosha are low in calories and rich in fiber, vitamin C and K. They are good for digestion and weight loss',
    ],
    storageAndUses: [
      'Pears Babbugosha keeps well in the refrigerator for a week due to their hard texture. Gently press your thumb near the stem end of the fruit. When it is soft, they are ready to eat.',
      'Feel the fresh texture of pears raw or in salads. Owing to the dense flesh, they can be consumed baked, roasted and grilled. Blend them into a smoothie when they over ripe',
    ],
    images: [
      'https://www.bigbasket.com/media/uploads/p/l/40029953_1-fresho-pears-babbugosha-organically-grown.jpg',
      'https://www.bigbasket.com/media/uploads/p/l/40029953_1-fresho-pears-babbugosha-organically-grown.jpg',
      'https://www.bigbasket.com/media/uploads/p/l/40029953_1-fresho-pears-babbugosha-organically-grown.jpg',
    ],
    imageUrl:
        'https://www.bigbasket.com/media/uploads/p/l/40029953_1-fresho-pears-babbugosha-organically-grown.jpg',
  ),
  Fruits(
    name: 'Avocado - Organically Grown,',
    description:
        'Fresho Organic products are organically grown and handpicked by expert.',
    id: DateTime.now().toIso8601String(),
    price: 143,
    offer: 20,
    unit: '500g',
    aboutTheProduct: [
      'Fresho Organic products are organically grown and handpicked by expert.',
      'Avocados are oval shaped fruits with a thick green and a bumpy, leathery outer skin.',
      'They have a unique-texture, with a creamy and light green coloured flesh that has a buttery flavour and special aroma',
    ],
    benefits: [
      'Avocados improve digestion and are good for heart health and vision',
      'They are rich in vitamins like C, E, K, B6, Magnesium, potassium and healthy fat.',
      'It prevents osteoporosis, cancer and reduces the risk of depression',
    ],
    storageAndUses: [
      'Store them in a cool, dry place away from direct sunlight',
      'When storing in the refrigerator, coat them with lemon juice before placing inside a container.',
      'Store cut avocados with onion chunks to prevent browning.',
    ],
    images: [
      'https://www.bigbasket.com/media/uploads/p/l/40049412_3-fresho-avocado-organically-grown.jpg',
      'https://www.bigbasket.com/media/uploads/p/l/40049412_3-fresho-avocado-organically-grown.jpg',
      'https://www.bigbasket.com/media/uploads/p/l/40049412_3-fresho-avocado-organically-grown.jpg',
    ],
    imageUrl:
        'https://www.bigbasket.com/media/uploads/p/l/40049412_3-fresho-avocado-organically-grown.jpg',
  ),
  Fruits(
    name: 'Pineapple',
    description:
        'The pineapple is a tropical plant  With an edible fruit and the most economically significant plant in the family Bromeliaceae. The pineapple is indigenous to South America, where it has been cultivated for many centuries',
    id: DateTime.now().toIso8601String(),
    price: 90,
    offer: 20,
    unit: '1pc',
    aboutTheProduct: [
      'Tiny and small sized, this variety is called Yelakki in Bangalore and Elaichi in Mumbai',
      'Despite its small size, they are naturally flavoured, aromatic and sweeter compared to regular bananas.'
    ],
    benefits: [
      'One banana supplies 30 percent of the daily vitamin B6 requirement and is rich in vitamin C, potassium and fiber.',
      'It reduces appetite and promotes weight loss, while also boosting the immune system and keeping the bones strong'
    ],
    storageAndUses: [
      'Store them in a cool, dry place away from direct sunlight. Fresh, raw yelakkis are green'
    ],
    images: [
      'https://www.jiomart.com/images/product/original/590000070/pineapple-queen-1-pc-0-20201119.jpg',
      'https://www.jiomart.com/images/product/original/590000070/pineapple-queen-1-pc-0-20201119.jpg',
      'https://www.jiomart.com/images/product/original/590000070/pineapple-queen-1-pc-0-20201119.jpg',
    ],
    imageUrl:
        'https://www.jiomart.com/images/product/original/590000070/pineapple-queen-1-pc-0-20201119.jpg',
  ),
];







/*

  product.forEach((e) {
              data.add({
                'name': e.name,
                'description': e.description,
                'price': e.price,
                'offer': e.offer,
                'unit': e.unit,
                'aboutTheProduct': [...e.aboutTheProduct!],
                'benefits': [...e.benefits!],
                'storageAndUses': [...e.storageAndUses!],
                'image': [...e.image!],
                'imageUrl': e.imageUrl,
              });
            });


Apples and pears
Citrus – oranges, grapefruits, mandarins and limes
Stone fruit – nectarines, apricots, peaches and plums
Tropical and exotic – bananas and mangoes
Berries – strawberries, raspberries, blueberries, kiwifruit and passionfruit
Melons – watermelons, rockmelons and honeydew melons
Tomatoes and avocados.

 */
