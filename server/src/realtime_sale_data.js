import _ from 'underscore';

const randomSaleData = () => [
  {year: "2021", sales: _.random(0, 100)},
  {year: "2020", sales: _.random(0, 100)},
  {year: "2019", sales: _.random(0, 100)},
  {year: "2018", sales: _.random(0, 100)},
  {year: "2017", sales: _.random(0, 100)},
  {year: "2016", sales: _.random(0, 100)},
]

export default io => {
  let loop;
  io.on('connection', (socket) => {
    console.log('A client connected');
    loop = setInterval(() => {
      socket.emit('sale_data', randomSaleData())
      console.log('emit')
    }, 10 * 1000)
 
    socket.on('disconnect', () => {
      clearInterval(loop);
      console.log('A client disconnected');
    });
 });
}