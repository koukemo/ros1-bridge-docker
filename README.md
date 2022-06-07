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
```shell
docker-compose up -d
```

Enter the container :
```shell
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
```shell
# Terminal 1
foxy-setup
ros2 run demo_nodes_cpp talker


# Terminal 2
noetic-setup
rosrun rospy_tutorials listener
```

-----

## Other Settings
What if you want to view the content you published in ROS1/ROS2 directly in `ros2 topic list` / `rostopic list` in ROS2/ROS1?

Rewrite the command of ros1-bridge in docker-compose.yml as follows :
```yml
command: /bin/bash -c "source /opt/ros/noetic/setup.bash; source /opt/ros/foxy/setup.bash; source /ros1_bridge_ws/install/setup.bash; ros2 run ros1_bridge dynamic_bridge"

↓

command: /bin/bash -c "source /opt/ros/noetic/setup.bash; source /opt/ros/foxy/setup.bash; source /ros1_bridge_ws/install/setup.bash; ros2 run ros1_bridge dynamic_bridge --bridge-all-topics"
```

For more information, browse here : [ros1_bridge > Example workspace setup](https://github.com/ros2/ros1_bridge/blob/master/doc/index.rst#example-workspace-setup)






