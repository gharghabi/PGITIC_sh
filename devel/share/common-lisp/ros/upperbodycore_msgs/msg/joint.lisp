; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-msg)


;//! \htmlinclude joint.msg.html

(cl:defclass <joint> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:integer
    :initform 0)
   (z
    :reader z
    :initarg :z
    :type cl:integer
    :initform 0)
   (img_x
    :reader img_x
    :initarg :img_x
    :type cl:integer
    :initform 0)
   (img_y
    :reader img_y
    :initarg :img_y
    :type cl:integer
    :initform 0)
   (mode
    :reader mode
    :initarg :mode
    :type cl:integer
    :initform 0))
)

(cl:defclass joint (<joint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <joint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'joint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-msg:<joint> is deprecated: use upperbodycore_msgs-msg:joint instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <joint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:x-val is deprecated.  Use upperbodycore_msgs-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <joint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:y-val is deprecated.  Use upperbodycore_msgs-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <joint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:z-val is deprecated.  Use upperbodycore_msgs-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'img_x-val :lambda-list '(m))
(cl:defmethod img_x-val ((m <joint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:img_x-val is deprecated.  Use upperbodycore_msgs-msg:img_x instead.")
  (img_x m))

(cl:ensure-generic-function 'img_y-val :lambda-list '(m))
(cl:defmethod img_y-val ((m <joint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:img_y-val is deprecated.  Use upperbodycore_msgs-msg:img_y instead.")
  (img_y m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <joint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:mode-val is deprecated.  Use upperbodycore_msgs-msg:mode instead.")
  (mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <joint>) ostream)
  "Serializes a message object of type '<joint>"
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'z)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'img_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'img_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <joint>) istream)
  "Deserializes a message object of type '<joint>"
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
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
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
      (cl:setf (cl:slot-value msg 'img_x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'img_y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<joint>)))
  "Returns string type for a message object of type '<joint>"
  "upperbodycore_msgs/joint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'joint)))
  "Returns string type for a message object of type 'joint"
  "upperbodycore_msgs/joint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<joint>)))
  "Returns md5sum for a message object of type '<joint>"
  "d5b5679d197aa491a6c71fbc8613d0e2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'joint)))
  "Returns md5sum for a message object of type 'joint"
  "d5b5679d197aa491a6c71fbc8613d0e2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<joint>)))
  "Returns full string definition for message of type '<joint>"
  (cl:format cl:nil "int32 x~%int32 y~%int32 z~%int32 img_x~%int32 img_y~%int32 mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'joint)))
  "Returns full string definition for message of type 'joint"
  (cl:format cl:nil "int32 x~%int32 y~%int32 z~%int32 img_x~%int32 img_y~%int32 mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <joint>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <joint>))
  "Converts a ROS message object to a list"
  (cl:list 'joint
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':img_x (img_x msg))
    (cl:cons ':img_y (img_y msg))
    (cl:cons ':mode (mode msg))
))
