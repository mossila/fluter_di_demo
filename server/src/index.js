import app from './app';

const port = process.env.PORT || 3000;

const start = async () => {
  app.listen(port, () => {
    console.log(`Server start at port ${port}`);
  });
};

start();
