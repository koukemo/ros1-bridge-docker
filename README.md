# ros1-bridge-docker
![ros1 bridge docker](https://img.shields.io/badge/ros1_bridge-docker-blue)

Provides a network bridge that allows message exchange between ROS1 and ROS2 in docker containers.


The repository also depends on the following packages : 
- [ros2/ros1_bridge - GitHub](https://github.com/ros2/ros1_bridge)

## Default ROS environments

---

- ROS : noetic
- ROS2 : foxy


## Installing

---

- Docker
- Dokcer Compose


## Building

---

Create container :
```
docker-compose up -d
```

Enter the container :
```
docker-compose exec ${container name} bash

# example
docker-compose exec ros1-bridge bash
```

Communication between ROS1 and ROS2 in a container : <br>
ros1(publisher) → ros2(subscriber)
```
# Terminal 1
noetic-setup
rosrun rospy_tutorials talker

# Terminal 2
foxy-setup
ros2 run demo_nodes_cpp listener
```

ros2(publisher) → ros1(subscriber)
```
# Terminal 1
foxy-setup
ros2 run demo_nodes_cpp talker


# Terminal 2
noetic-setup
rosrun rospy_tutorials listener
```





