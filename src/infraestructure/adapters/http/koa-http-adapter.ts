import Koa from 'koa';
import Router from 'koa-router';
import shared from '../../../shared';
const router = new Router();

router.get('/status-check', async (ctx: Koa.Context) => {
  ctx.body = shared.StatusCheck.running
});

router.post('/api/users', async (ctx: Koa.Context) => {
  ctx.status = 200;
  ctx.body = ctx.request.body;
});

router.get('/api/users', async (ctx: Koa.Context) => {
  ctx.status = 200;
  ctx.body = [];
});

export default router;