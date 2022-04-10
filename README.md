# ProjetUlamIGSD

Le but de ce projet est de realiser deux modèles 3D composées de morceaux (cubes,
spheres, cylindres, etc..) dont chacun représente un nombre à partir de 1. Chaque morceaux
est placé dans l’espace 3D par une technique que vous choisirez et implémenterez. Le
morceau sera aussi colorié en fonction du nombre qu’il représente, par exemple un nombre
premier sera colorié en jaune. Pour différencier un peu plus les nombre (premiers ou pas
premiers) vous implémenterez d’abord une fonction sd() qui calcule la somme des diviseurs.
Ainsi sd(13) = 13+1 = 14 car 13 ne se divise que par 1 et par lui même. sd(9)=1+9+3=12. Ce
nombre est dit déficient car 12 est plus petit que deux fois le nombre(9) dont il est issu(<2*9).
Un autre exemple sd(28)=1+28+14+2+7+4= 56 = 2*28. Ce nombre est dit parfait. Un
dernier exemple avec sd(12)=1+2+4+6+12=25 >2*12. Ce nombre est dit abondant. Vous
pourrez ainsi colorier vos morceaux en fonction de la nature du nombre (premier, deficient,
parfait ou abondant) ou meme faire varier la couleur en fonction de l’abondance sd(n)-2n ou
toute autre valeur que vous jugerez pertinente.

## Les formes
Si la spirale d’Ulam originale est en
2D (il s’agit d’une spirale carrée), de
nombreuses autre formes sont possibles en
2d (spirale ronde, hexagonale, triangle) en
utilisant la 3ieme dimension pour montrer
l’abondance ou bien des formes
complètement en 3D (cones, pyramides,
cubes, etc)
Si vous êtes un binômes vous devrez realiser 2 formes différentes cote a cote. Si vous
faites le projet seul vous pourrez afficher 2 fois la meme forme en prenant soin de factoriser la
creation de la PShape dans une fonction appellee 2 fois.

## Les textures
Dans la dernière pyramide ci-dessus, les cents premiers morceaux (ici des cubes) sont
texturés avec une image du nombre qu’ils représentent. C’est tres utile pour debugger la
premiere partie mais aussi pour faire comprendre à l’utilisateur comment vous avez choisi
d’organiser les nombres dans l’espace 3D. Vous pourrez créer une seule texture (un
PGraphics) et dessiner dedans a différents endroits. Ie :
pg.beginDraw();
pg.text("37", 7*64, 3*32);
pg.endDraw()
Bien sur vous pouvez ne pas remplir la dernière case (ie "99" en 9*64, 9*32) et donner
les coordonnées de textures adéquates a chaque face de vos cubes ou sur vos sphères

## Les nombres
Plutôt que d’afficher les nombre de 1 en 1, vous utiliserez un polynôme (ie 2x affichera
tous les nombres pairs) que l’utilisateur peut explorer avec 6 boutons du clavier ou 6
rectangles au dessus/au dessous de l’affichage du polynôme. Au final l’utilisateur devra
pouvoir augmenter/réduire les 3 termes du polynôme. Comme le calcul peut etre un peu
long il est preferable de stoker les valeurs de sf(x) pour N valeurs de x dans un tableau de N
entiers. Ce calcul se fera une seule fois dans setup() ou dans mouseClicked ou keyPressed()
quand les termes du polynôme changent. Pour les "boutons" il s’agit de 6 rectangles dessinés
dans draw() et de 6 tests dans mouseClicked() qui réagissent si la souris a cliqué exactement
dans l’un des 6 carrés.

## Le picking
  Afin de permettre de tester ou se trouve un nombre dans les 2 formes affichées nous
souhaitons pouvoir "cliquer" sur un nombre et que ce dernier s’affiche différemment dans les
2 formes. Pour se faire vous donnerez une nombre en attribut sur les vertex qui le
représentent mypshape.attrib("idnum", (float)nn);
Il est préférable de passer un flottant pour des raisons de performances mais bien sur il
représente toujours un entier. Vous créerez ensuite un shader qui declare cet attribut pour
chaque vertex et le met en interpolation entre chaque vertex. Si tous les sommet/vertices d’un
cube/sphere on le meme nombre k’interpolation au niveau du fragment/pixel donnera
forcement le meme nombre. Vous passerez par ailleurs une valeur uniforme avec
myshader.set("idselect", 28) et vous déclarerez une variable uniforme (ici idselect) dans votre
shader. Les valuers uniform étant uniformes sur tous les vertex pas besoin de les interpoler.
On peut récupérer la valeur directement dans le fragment. Il ne reste plus qu’a tester les 2
nombres avec une petite tolerance (ie 0.1) et afficher une couleur spéciale pour les pixels en
questions. Ainsi il n’y a pas besoin de refaire le modele quand le nombre cliqué change .
Pour savoir quel nombre est cliqué il faut faire un autre shader plus malin. Ce shader affiche
une couleur en fonction du nombre (passé en attribut). Il faut diviser le nombre en trois
parties avec la fonction modulo :
N0 = mod(n, 256),
N1 = mod ((n-N0 ) /256), 256);
N2 = mod ((n-N0-N1*256 ) /256*256), 256);
Sachant que l’on pourra reconstruire n = N0+N1*256+n2*256*256 il suffit de donner
comme r, g et b des pixels fragments N0/255.0, N1/255.0 et N2/255.0
Ainsi dans la fonction mouseCliqued() il faudra créer un PGraphics pour la 3D et tout
afficher dedans avec le nouveau shader
g1 = createGraphics(1540, 1560, P3D);
g1.loadPixels() ;
g1.beginDraw();
//preparation du dessin ici (translate, rotate, etc
g1.shader(nouveauShader);
// il faudra peut-etre recréer les modèles ici
g1.shape(monModele3D);
g1.resetShader();
g1.endDraw();
Cette technique n’affiche rien a l’ecran mais dessine dans une image ou il est ensuite possible
de "lire" la couleur des pixels, par exemple sous la souris sous la souris avec
int p = g1.get(mouseX, mouseY);
Et avec les blue(p), green(pet red(p) qui par magie sont entre 0 et 255 on peut recréer le
nombre n qui a été clique avec la sou
