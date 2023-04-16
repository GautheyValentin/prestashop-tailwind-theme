# Prestashop Theme (TailWind - AlpineJS)

Status Project : ```Deprecated```
Projet Proof of concept

## ⚠️ Personal Experience Developper ⚠️
I don't recomand to use tailwind in prestashop, it's too difficult to deal with selector because there are too much.
Stay with basic SCSS is better.
Typescript is a mistake too due to untyped library.


## [Demo](https://gautheyminiatures.fr)
## [Release](https://github.com/GautheyValentin/prestashop-tailwind-theme/releases)

## ⚠️ IMPORTANT ⚠️
Core is in project and it will be recode
If you lanch dev or build, your core.js will be delete

## Lib
- Tailwind
- Tailwind Form
- Alpine JS
- Basic dep Prestashop

## Supported
- Basic Use
- Prestablog
  
## ToDo
- No any more types
- Recode Core to typescript and refractor
- Implement Axios
- Implement Vue and remove Alpine Js and JQuery
- Colissimo without jquery and add relay point

## Dev
Create directory ```prestashop-tailwind-theme``` in ```themes```

Create _dev directory in ```prestashop-tailwind-theme```

Clone the repo in dev

Create ```.env``` and add 
```
BROWSER_PROXY=
BROWSER_PORT=
BROWSER_HTTPS=
```

Install and Start 
```sh 
yarn install
```

```sh 
yarn start
```

Happy Coding !

## Build

Same protocol of dev but you don't need .env

```sh 
yarn build
```

## Zip

```sh 
yarn build:zip
```

## Contributing
To preserve your time, you can open an issue before to start coding to discuss about it

## Support
If you like the project, you can buy an article on the demo site

## Licence
```MIT```