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
docker-compose exec ros1bridge bash
```

Communication between ROS1 and ROS2 in a container :
```
# Terminal 1
source /opt/ros/noetic/setup.bash
rosrun rospy_tutorials talker

# Terminal 2
source /opt/ros/foxy/setup.bash
ros2 run demo_nodes_cpp listener
```





