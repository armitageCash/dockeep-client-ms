import Koa from 'koa';
import router from '../../infraestructure/adapters/http/koa-http-adapter';

const app = new Koa();

app.use(router.routes());
app.use(router.allowedMethods());

app.listen(3000, () => {
  console.log('Servidor Koa en funcionamiento en el puerto 3000');  
});