import express from 'express';
import morgan from 'morgan';
import { chat } from '@api/chat';

const app = express();

app.use(morgan('combined'));
app.disable('x-powered-by');

// health check
app.get('/v1/health', (_, res) => res.send('healthy!'));

app.get('/v1/chat', (_, res) => res.send('healthy!'));

export default app;
