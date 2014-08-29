; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-msg)


;//! \htmlinclude user.msg.html

(cl:defclass <user> (roslisp-msg-protocol:ros-message)
  ((Head
    :reader Head
    :initarg :Head
    :type upperbodycore_msgs-msg:joint
    :initform (cl:make-instance 'upperbodycore_msgs-msg:joint))
   (Torso
    :reader Torso
    :initarg :Torso
    :type upperbodycore_msgs-msg:joint
    :initform (cl:make-instance 'upperbodycore_msgs-msg:joint))
   (RightHand
    :reader RightHand
    :initarg :RightHand
    :type upperbodycore_msgs-msg:joint
    :initform (cl:make-instance 'upperbodycore_msgs-msg:joint))
   (LeftHand
    :reader LeftHand
    :initarg :LeftHand
    :type upperbodycore_msgs-msg:joint
    :initform (cl:make-instance 'upperbodycore_msgs-msg:joint))
   (LeftFoot
    :reader LeftFoot
    :initarg :LeftFoot
    :type upperbodycore_msgs-msg:joint
    :initform (cl:make-instance 'upperbodycore_msgs-msg:joint))
   (RightFoot
    :reader RightFoot
    :initarg :RightFoot
    :type upperbodycore_msgs-msg:joint
    :initform (cl:make-instance 'upperbodycore_msgs-msg:joint))
   (id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0))
)

(cl:defclass user (<user>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <user>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'user)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-msg:<user> is deprecated: use upperbodycore_msgs-msg:user instead.")))

(cl:ensure-generic-function 'Head-val :lambda-list '(m))
(cl:defmethod Head-val ((m <user>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:Head-val is deprecated.  Use upperbodycore_msgs-msg:Head instead.")
  (Head m))

(cl:ensure-generic-function 'Torso-val :lambda-list '(m))
(cl:defmethod Torso-val ((m <user>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:Torso-val is deprecated.  Use upperbodycore_msgs-msg:Torso instead.")
  (Torso m))

(cl:ensure-generic-function 'RightHand-val :lambda-list '(m))
(cl:defmethod RightHand-val ((m <user>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:RightHand-val is deprecated.  Use upperbodycore_msgs-msg:RightHand instead.")
  (RightHand m))

(cl:ensure-generic-function 'LeftHand-val :lambda-list '(m))
(cl:defmethod LeftHand-val ((m <user>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:LeftHand-val is deprecated.  Use upperbodycore_msgs-msg:LeftHand instead.")
  (LeftHand m))

(cl:ensure-generic-function 'LeftFoot-val :lambda-list '(m))
(cl:defmethod LeftFoot-val ((m <user>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:LeftFoot-val is deprecated.  Use upperbodycore_msgs-msg:LeftFoot instead.")
  (LeftFoot m))

(cl:ensure-generic-function 'RightFoot-val :lambda-list '(m))
(cl:defmethod RightFoot-val ((m <user>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:RightFoot-val is deprecated.  Use upperbodycore_msgs-msg:RightFoot instead.")
  (RightFoot m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <user>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:id-val is deprecated.  Use upperbodycore_msgs-msg:id instead.")
  (id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <user>) ostream)
  "Serializes a message object of type '<user>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Head) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Torso) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'RightHand) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'LeftHand) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'LeftFoot) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'RightFoot) ostream)
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <user>) istream)
  "Deserializes a message object of type '<user>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Head) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Torso) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'RightHand) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'LeftHand) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'LeftFoot) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'RightFoot) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<user>)))
  "Returns string type for a message object of type '<user>"
  "upperbodycore_msgs/user")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'user)))
  "Returns string type for a message object of type 'user"
  "upperbodycore_msgs/user")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<user>)))
  "Returns md5sum for a message object of type '<user>"
  "3118245be98de8d397dad1fbd4d66719")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'user)))
  "Returns md5sum for a message object of type 'user"
  "3118245be98de8d397dad1fbd4d66719")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<user>)))
  "Returns full string definition for message of type '<user>"
  (cl:format cl:nil "joint Head~%joint Torso~%joint RightHand~%joint LeftHand~%joint LeftFoot~%joint RightFoot~%int32 id~%~%================================================================================~%MSG: upperbodycore_msgs/joint~%int32 x~%int32 y~%int32 z~%int32 img_x~%int32 img_y~%int32 mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'user)))
  "Returns full string definition for message of type 'user"
  (cl:format cl:nil "joint Head~%joint Torso~%joint RightHand~%joint LeftHand~%joint LeftFoot~%joint RightFoot~%int32 id~%~%================================================================================~%MSG: upperbodycore_msgs/joint~%int32 x~%int32 y~%int32 z~%int32 img_x~%int32 img_y~%int32 mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <user>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Head))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Torso))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'RightHand))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'LeftHand))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'LeftFoot))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'RightFoot))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <user>))
  "Converts a ROS message object to a list"
  (cl:list 'user
    (cl:cons ':Head (Head msg))
    (cl:cons ':Torso (Torso msg))
    (cl:cons ':RightHand (RightHand msg))
    (cl:cons ':LeftHand (LeftHand msg))
    (cl:cons ':LeftFoot (LeftFoot msg))
    (cl:cons ':RightFoot (RightFoot msg))
    (cl:cons ':id (id msg))
))
