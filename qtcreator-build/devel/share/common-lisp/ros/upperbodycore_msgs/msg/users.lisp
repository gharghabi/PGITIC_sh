; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-msg)


;//! \htmlinclude users.msg.html

(cl:defclass <users> (roslisp-msg-protocol:ros-message)
  ((count
    :reader count
    :initarg :count
    :type cl:integer
    :initform 0)
   (users
    :reader users
    :initarg :users
    :type (cl:vector upperbodycore_msgs-msg:user)
   :initform (cl:make-array 0 :element-type 'upperbodycore_msgs-msg:user :initial-element (cl:make-instance 'upperbodycore_msgs-msg:user)))
   (z
    :reader z
    :initarg :z
    :type cl:integer
    :initform 0)
   (x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (tracked
    :reader tracked
    :initarg :tracked
    :type cl:integer
    :initform 0))
)

(cl:defclass users (<users>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <users>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'users)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-msg:<users> is deprecated: use upperbodycore_msgs-msg:users instead.")))

(cl:ensure-generic-function 'count-val :lambda-list '(m))
(cl:defmethod count-val ((m <users>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:count-val is deprecated.  Use upperbodycore_msgs-msg:count instead.")
  (count m))

(cl:ensure-generic-function 'users-val :lambda-list '(m))
(cl:defmethod users-val ((m <users>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:users-val is deprecated.  Use upperbodycore_msgs-msg:users instead.")
  (users m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <users>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:z-val is deprecated.  Use upperbodycore_msgs-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <users>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:x-val is deprecated.  Use upperbodycore_msgs-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'tracked-val :lambda-list '(m))
(cl:defmethod tracked-val ((m <users>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:tracked-val is deprecated.  Use upperbodycore_msgs-msg:tracked instead.")
  (tracked m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <users>) ostream)
  "Serializes a message object of type '<users>"
  (cl:let* ((signed (cl:slot-value msg 'count)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'users))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'users))
  (cl:let* ((signed (cl:slot-value msg 'z)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'tracked)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <users>) istream)
  "Deserializes a message object of type '<users>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'count) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'users) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'users)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'upperbodycore_msgs-msg:user))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'z) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tracked) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<users>)))
  "Returns string type for a message object of type '<users>"
  "upperbodycore_msgs/users")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'users)))
  "Returns string type for a message object of type 'users"
  "upperbodycore_msgs/users")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<users>)))
  "Returns md5sum for a message object of type '<users>"
  "7a00c3d88998fc0bf609372f1044891e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'users)))
  "Returns md5sum for a message object of type 'users"
  "7a00c3d88998fc0bf609372f1044891e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<users>)))
  "Returns full string definition for message of type '<users>"
  (cl:format cl:nil "int32 count~%user[] users~%int32 z~%int32 x~%int32 tracked~%~%~%================================================================================~%MSG: upperbodycore_msgs/user~%joint Head~%joint Torso~%joint RightHand~%joint LeftHand~%joint LeftFoot~%joint RightFoot~%int32 id~%~%================================================================================~%MSG: upperbodycore_msgs/joint~%int32 x~%int32 y~%int32 z~%int32 img_x~%int32 img_y~%int32 mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'users)))
  "Returns full string definition for message of type 'users"
  (cl:format cl:nil "int32 count~%user[] users~%int32 z~%int32 x~%int32 tracked~%~%~%================================================================================~%MSG: upperbodycore_msgs/user~%joint Head~%joint Torso~%joint RightHand~%joint LeftHand~%joint LeftFoot~%joint RightFoot~%int32 id~%~%================================================================================~%MSG: upperbodycore_msgs/joint~%int32 x~%int32 y~%int32 z~%int32 img_x~%int32 img_y~%int32 mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <users>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'users) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <users>))
  "Converts a ROS message object to a list"
  (cl:list 'users
    (cl:cons ':count (count msg))
    (cl:cons ':users (users msg))
    (cl:cons ':z (z msg))
    (cl:cons ':x (x msg))
    (cl:cons ':tracked (tracked msg))
))
