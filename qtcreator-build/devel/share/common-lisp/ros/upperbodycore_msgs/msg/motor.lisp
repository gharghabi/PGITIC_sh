; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-msg)


;//! \htmlinclude motor.msg.html

(cl:defclass <motor> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type cl:integer
    :initform 0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:integer
    :initform 0))
)

(cl:defclass motor (<motor>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motor>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motor)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-msg:<motor> is deprecated: use upperbodycore_msgs-msg:motor instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <motor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:position-val is deprecated.  Use upperbodycore_msgs-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <motor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:speed-val is deprecated.  Use upperbodycore_msgs-msg:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motor>) ostream)
  "Serializes a message object of type '<motor>"
  (cl:let* ((signed (cl:slot-value msg 'position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motor>) istream)
  "Deserializes a message object of type '<motor>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'position) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motor>)))
  "Returns string type for a message object of type '<motor>"
  "upperbodycore_msgs/motor")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motor)))
  "Returns string type for a message object of type 'motor"
  "upperbodycore_msgs/motor")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motor>)))
  "Returns md5sum for a message object of type '<motor>"
  "70cb5f8146d634b82e1457229b83b8e8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motor)))
  "Returns md5sum for a message object of type 'motor"
  "70cb5f8146d634b82e1457229b83b8e8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motor>)))
  "Returns full string definition for message of type '<motor>"
  (cl:format cl:nil "int32 position~%int32 speed~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motor)))
  "Returns full string definition for message of type 'motor"
  (cl:format cl:nil "int32 position~%int32 speed~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motor>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motor>))
  "Converts a ROS message object to a list"
  (cl:list 'motor
    (cl:cons ':position (position msg))
    (cl:cons ':speed (speed msg))
))
