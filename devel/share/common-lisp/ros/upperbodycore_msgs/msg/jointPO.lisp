; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-msg)


;//! \htmlinclude jointPO.msg.html

(cl:defclass <jointPO> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type (cl:vector geometry_msgs-msg:Vector3)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Vector3 :initial-element (cl:make-instance 'geometry_msgs-msg:Vector3)))
   (orientation
    :reader orientation
    :initarg :orientation
    :type (cl:vector geometry_msgs-msg:Quaternion)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Quaternion :initial-element (cl:make-instance 'geometry_msgs-msg:Quaternion))))
)

(cl:defclass jointPO (<jointPO>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <jointPO>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'jointPO)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-msg:<jointPO> is deprecated: use upperbodycore_msgs-msg:jointPO instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <jointPO>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:position-val is deprecated.  Use upperbodycore_msgs-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'orientation-val :lambda-list '(m))
(cl:defmethod orientation-val ((m <jointPO>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:orientation-val is deprecated.  Use upperbodycore_msgs-msg:orientation instead.")
  (orientation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <jointPO>) ostream)
  "Serializes a message object of type '<jointPO>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'position))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'orientation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'orientation))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <jointPO>) istream)
  "Deserializes a message object of type '<jointPO>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'position) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'position)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Vector3))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'orientation) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'orientation)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Quaternion))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<jointPO>)))
  "Returns string type for a message object of type '<jointPO>"
  "upperbodycore_msgs/jointPO")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'jointPO)))
  "Returns string type for a message object of type 'jointPO"
  "upperbodycore_msgs/jointPO")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<jointPO>)))
  "Returns md5sum for a message object of type '<jointPO>"
  "e45d45a5a1ce597b249e23fb30fc871f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'jointPO)))
  "Returns md5sum for a message object of type 'jointPO"
  "e45d45a5a1ce597b249e23fb30fc871f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<jointPO>)))
  "Returns full string definition for message of type '<jointPO>"
  (cl:format cl:nil "geometry_msgs/Vector3[] position~%geometry_msgs/Quaternion[] orientation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'jointPO)))
  "Returns full string definition for message of type 'jointPO"
  (cl:format cl:nil "geometry_msgs/Vector3[] position~%geometry_msgs/Quaternion[] orientation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <jointPO>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'orientation) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <jointPO>))
  "Converts a ROS message object to a list"
  (cl:list 'jointPO
    (cl:cons ':position (position msg))
    (cl:cons ':orientation (orientation msg))
))
