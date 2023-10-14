const Koa = require('koa');
const Router = require('koa-router');

const app = new Koa();
const router = new Router();

router.get('/apigateway', async (ctx) => {
  ctx.status = 200;
  ctx.body = 'hello Fargate';
});

router.get('/status-check', async (ctx) => {
  ctx.status = 200;
  ctx.body = 'La aplicación está en funcionamiento';
});

app.use(router.routes());
app.use(router.allowedMethods());

app.listen(3000, () => {
  console.log('Servidor Koa en funcionamiento en el puerto 3000');
});