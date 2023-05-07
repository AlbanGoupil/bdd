import { v4 as uuidv4 } from 'uuid';

export default (Order) => {

  const orders = [
    new Order(
      'e8620a90-e4ff-11ed-b5ea-0242ac120002',
      '2023-04-27',
      'a35ce12d-d52b-4a07-90ad-68e985b779e7',
      "10",
      'a35ce12d-d52b-4a07-63ap-68e985b7a85z'
    ),
    new Order(
      'f71d7844-e4ff-11ed-b5ea-0242ac120002',
      '2023-03-12',
      'dc466424-4297-481a-a8de-aa0898852da1',
      "5",
      'a35ce12d-dmqb-43a7-6q9p-681a5s4a8z36'
    ),
  ]
  
  
  const findOrder = (id) => {
    return orders.find((order) => order.id === id);
  }

  const listOrders = () => {
    return orders;
  };

  const createOrder = (orderData) => {

    const order = new Order(
      uuidv4(),
      orderData.orderDate,
      orderData.orderId,
      orderData.quantity,
      orderData.userId
    );

    orders.push(order);
    return order;
  }

  const updateOrder = (id, orderData) => {
    let foundorderIdx = -1;
    orders.forEach((order, idx) => {
      if (order.id === id) {
        foundorderIdx = idx;
      }
    });

    if (foundorderIdx > -1) {
      orders[foundorderIdx] = Object.assign(orders[foundorderIdx], orderData);
      return orders[foundorderIdx];
    }

    return null;
  }

  const deleteOrder = (id) => {
    let orderToDeleteIndex = orders.findIndex((b) => b.id === id);

    if (orderToDeleteIndex > -1) {
      let deletedorder = orders.splice(orderToDeleteIndex, 1)[0];
      return deletedorder;
    }

    return null;
  }

  return {
    listOrders,
    findOrder,
    createOrder,
    updateOrder,
    deleteOrder
  };
};
