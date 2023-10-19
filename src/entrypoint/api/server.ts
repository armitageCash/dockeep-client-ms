import Koa from 'koa';
import router from '../../infraestructure/adapters/http/koa-http-adapter';
import bodyParser from 'koa-bodyparser';

const app = new Koa();

app.use(bodyParser())
  .use(router.routes())
  .use(router.allowedMethods());

app.listen(3000, () => {
  console.log('Servidor Koa en funcionamiento en el puerto 3000');  
});