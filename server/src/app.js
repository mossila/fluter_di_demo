import express from 'express';
import http from 'http';
import socketIo from 'socket.io';
import cors from 'cors';
import path from 'path';
import realtime_sale_data from './realtime_sale_data';

const app = express();
const server = http.createServer(app);
const io = socketIo(server);
io.origins([
  'http://localhost:3000', 
  'http://localhost:61290',
  'http://192.168.1.38:3000'
])

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended: true}));

realtime_sale_data(io);

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '../', 'index.html'));
});

export default server;
