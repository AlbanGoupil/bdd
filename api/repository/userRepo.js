import { v4 as uuidv4 } from 'uuid';

export default (User) => {
  const users = [
    new User(
      'a35ce12d-d52b-4a07-63ap-68e985b7a85z',
      'De Monredon',
      'Simon',
      '2000-09-25',
      '13 rue de Vibraye',
      '0786189288',
      'simon@gmail.com',
    ),
    new User(
      'a35ce12d-dmqb-43a7-6q9p-681a5s4a8z36',
      'Leroux',
      'Valentin',
      '2001-07-22',
      'Chateau de glaix Cherreau',
      '0123456789',
      'valou@gmail.com'
    )
  ]

  const findUser = (id) => {
    return users.find((user) => user.id === id);
  }

  const listUsers = () => {
    return users;
  };

  const createUser = (userData) => {
    const user = new User(
      uuidv4(),
      userData.lastName,
      userData.firstName,
      userData.birthDate,
      userData.address,
      userData.phone,
      userData.email
    );

    users.push(user);
    return user;
  }

  const updateUser = (id, userData) => {
    let foundUserIdx = -1;
    users.forEach((user, idx) => {
      if (user.id === id) {
        foundUserIdx = idx;
      }
    });

    if (foundUserIdx > -1) {
      users[foundUserIdx] = Object.assign(users[foundUserIdx], userData);
      return users[foundUserIdx];
    }

    return null;
  }

  const deleteUser = (id) => {
    let userToDeleteIndex = users.findIndex((b) => b.id === id);

    if (userToDeleteIndex > -1) {
      let deletedUser = users.splice(userToDeleteIndex, 1)[0];
      return deletedUser;
    }

    return null;
  }

  return {
    listUsers,
    createUser,
    findUser,
    updateUser,
    deleteUser
  }
}