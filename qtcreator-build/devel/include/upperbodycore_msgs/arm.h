/* Software License Agreement (BSD License)
 *
 * Copyright (c) 2011, Willow Garage, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *  * Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials provided
 *    with the distribution.
 *  * Neither the name of Willow Garage, Inc. nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * Auto-generated by genmsg_cpp from file /home/shaghayegh/catkin_ws/src/upperbodycore_msgs/msg/arm.msg
 *
 */


#ifndef UPPERBODYCORE_MSGS_MESSAGE_ARM_H
#define UPPERBODYCORE_MSGS_MESSAGE_ARM_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace upperbodycore_msgs
{
template <class ContainerAllocator>
struct arm_
{
  typedef arm_<ContainerAllocator> Type;

  arm_()
    : shoulder_pitch(0)
    , shoulder_roll(0)
    , elbow(0)
    , wrist_pitch(0)
    , wrist_roll(0)  {
    }
  arm_(const ContainerAllocator& _alloc)
    : shoulder_pitch(0)
    , shoulder_roll(0)
    , elbow(0)
    , wrist_pitch(0)
    , wrist_roll(0)  {
    }



   typedef int16_t _shoulder_pitch_type;
  _shoulder_pitch_type shoulder_pitch;

   typedef int16_t _shoulder_roll_type;
  _shoulder_roll_type shoulder_roll;

   typedef int16_t _elbow_type;
  _elbow_type elbow;

   typedef int16_t _wrist_pitch_type;
  _wrist_pitch_type wrist_pitch;

   typedef int16_t _wrist_roll_type;
  _wrist_roll_type wrist_roll;




  typedef boost::shared_ptr< ::upperbodycore_msgs::arm_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::upperbodycore_msgs::arm_<ContainerAllocator> const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;

}; // struct arm_

typedef ::upperbodycore_msgs::arm_<std::allocator<void> > arm;

typedef boost::shared_ptr< ::upperbodycore_msgs::arm > armPtr;
typedef boost::shared_ptr< ::upperbodycore_msgs::arm const> armConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::upperbodycore_msgs::arm_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::upperbodycore_msgs::arm_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace upperbodycore_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'upperbodycore_msgs': ['/home/shaghayegh/catkin_ws/src/upperbodycore_msgs/msg', '/home/shaghayegh/catkin_ws/qtcreator-build/devel/share/upperbodycore_msgs/msg'], 'geometry_msgs': ['/opt/ros/hydro/share/geometry_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/hydro/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/hydro/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::upperbodycore_msgs::arm_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::upperbodycore_msgs::arm_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::upperbodycore_msgs::arm_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::upperbodycore_msgs::arm_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::upperbodycore_msgs::arm_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::upperbodycore_msgs::arm_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::upperbodycore_msgs::arm_<ContainerAllocator> >
{
  static const char* value()
  {
    return "8aac345dde980bb2608ac1391f6ee8ef";
  }

  static const char* value(const ::upperbodycore_msgs::arm_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x8aac345dde980bb2ULL;
  static const uint64_t static_value2 = 0x608ac1391f6ee8efULL;
};

template<class ContainerAllocator>
struct DataType< ::upperbodycore_msgs::arm_<ContainerAllocator> >
{
  static const char* value()
  {
    return "upperbodycore_msgs/arm";
  }

  static const char* value(const ::upperbodycore_msgs::arm_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::upperbodycore_msgs::arm_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int16 shoulder_pitch\n\
int16 shoulder_roll\n\
int16 elbow\n\
int16 wrist_pitch\n\
int16 wrist_roll\n\
";
  }

  static const char* value(const ::upperbodycore_msgs::arm_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::upperbodycore_msgs::arm_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.shoulder_pitch);
      stream.next(m.shoulder_roll);
      stream.next(m.elbow);
      stream.next(m.wrist_pitch);
      stream.next(m.wrist_roll);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct arm_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::upperbodycore_msgs::arm_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::upperbodycore_msgs::arm_<ContainerAllocator>& v)
  {
    s << indent << "shoulder_pitch: ";
    Printer<int16_t>::stream(s, indent + "  ", v.shoulder_pitch);
    s << indent << "shoulder_roll: ";
    Printer<int16_t>::stream(s, indent + "  ", v.shoulder_roll);
    s << indent << "elbow: ";
    Printer<int16_t>::stream(s, indent + "  ", v.elbow);
    s << indent << "wrist_pitch: ";
    Printer<int16_t>::stream(s, indent + "  ", v.wrist_pitch);
    s << indent << "wrist_roll: ";
    Printer<int16_t>::stream(s, indent + "  ", v.wrist_roll);
  }
};

} // namespace message_operations
} // namespace ros

#endif // UPPERBODYCORE_MSGS_MESSAGE_ARM_H