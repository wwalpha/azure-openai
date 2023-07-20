import express from 'express';
import morgan from 'morgan';

const app = express();

app.use(morgan('combined'));
app.disable('x-powered-by');

// health check
app.get('/v1/health', (_, res) => res.send('healthy'));

export default app;
