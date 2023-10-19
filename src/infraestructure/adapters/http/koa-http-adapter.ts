import Koa from 'koa';
import Router from 'koa-router';

const router = new Router();

router.get('/apigateway', async (ctx: Koa.Context) => {
  ctx.status = 200;
  ctx.body = 'hello Fargate';
});

router.get('/status-check', async (ctx: Koa.Context) => {
  ctx.status = 200;
  ctx.body = 'La aplicación está en funcionamiento';
});

router.post('/users', async (ctx: Koa.Context) => {
  ctx.status = 200;
  ctx.body = ctx.request.body;
});


export default router;