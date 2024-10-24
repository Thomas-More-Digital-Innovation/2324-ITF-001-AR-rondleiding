# 2324-ITF-001-AR-rondleiding

**2 docent van de IT-factory (Michaël Cloots & Sarah Moeremans) hebben ons gevraagd om een Proof of Concept te maken voor een applicatie die nieuwe (buitenlandse) studenten/docenten kan helpen te acclimatiseren aan de grote campus van Geel. We zouden een applicatie moeten bouwen die het concept op een leuke manier laat zien. Zo kan Michaël & Sarah hiermee naar hoger Thomas More management gaan voor budget aan te vragen om de applicatie in productie te nemen.**

## Enkele belangrijke features

- info krijgen over speciale plaatsen op de campus
- De applicatie moet meerdere talen ondersteunen (vooral engels en nederlands)
- Iedereen moet het op zijn mobiele telefoon kunnen gebruiken

## Mock-up

**Figma**: [link naar figma]("https://www.figma.com/proto/UZpcV1O9jElgpOnIFi0qLN/AR-rondleiding?page-id=0%3A1&node-id=1-3&node-type=canvas&viewport=700%2C527%2C0.93&t=E6ITg2acx4zagTFb-1&scaling=scale-down&content-scaling=fixed&starting-point-node-id=1%3A3")

Wanner je de app opent kom je op een scherm terecht waar je een map kan zien van de school. LET OP, er moet niet ingelogd worden aangezien de uitleg is voor iedereen hetzelfde is. Wanneer je op het startscherm zit kan je kijken waar je jezelf ergens bevindt en zo een locatie bij jou in de buurt selecteren. Eens je deze locatie selecteert zal er een transitie gebeuren naar je camera.

Wanneer de camera open staat kan je kijken waar de QR-code zit en wanneer je deze scant zal je gids tevoorschijn komen. Op het scherm zie je 3 belangrijke features:

- Rechts boven kan je een knop vinden om de gids opnieuw zijn uitleg te laten doen.
- Links boven zie je een knop om terug naar het vorige scherm te gaan.
- Onderaan kan je een uitschuifbare sectie zien met de uitleg die de gids geeft in tekst vorm.

Wanneer je terug op het beginscherm zit is het natuurlijk mogelijk dat je niet weet waar je jezelf bevindt. Als je dan toch ergens een qr-code tegenkomt kan je deze scannen, laat hij zien waar je ergens bent en kan je als nog de uitleg starten als je dit zou willen! Dit doe je door op het beginscherm, op de camera knop onderaan in beel te duwen.

## Tech Stack

**[vuforia](https://developer.vuforia.com/home)** - - API - - > **[Unity](https://unity.com/products?c=unity+engine&s=education)** - - [flutter-unity-view-widget](https://github.com/juicycleff/flutter-unity-view-widget) - - > **[Flutter](https://flutter.dev/development)**

Voor de rondleiding echt to leven te laten komen gaan we gebruik maken van **[vuforia](https://developer.vuforia.com/home)** om 'plane detectie', 'Point-of-Interest detectie' en het renderen van de guide te doen. Vuforia kan niet rechtstreeks connecteren met een Flutter project, daarom maken we gebruik van Unity als bindmiddel. Vuforia kan connecteren met een **[Unity](https://unity.com/products?c=unity+engine&s=education)** Scene aan de hand van een API. In deze scene zal er dan een gids verschijnen. Deze scene kan dan op zijn beurt wel getoond worden door gebruik te maken van de package **[flutter-unity-view-widget](https://github.com/juicycleff/flutter-unity-view-widget)**. Dit is een package die de scene kan laten zien in een flutter applicatie.
