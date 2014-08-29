; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-msg)


;//! \htmlinclude omnidata.msg.html

(cl:defclass <omnidata> (roslisp-msg-protocol:ros-message)
  ((d0
    :reader d0
    :initarg :d0
    :type cl:fixnum
    :initform 0)
   (d1
    :reader d1
    :initarg :d1
    :type cl:fixnum
    :initform 0)
   (d2
    :reader d2
    :initarg :d2
    :type cl:fixnum
    :initform 0)
   (d3
    :reader d3
    :initarg :d3
    :type cl:fixnum
    :initform 0))
)

(cl:defclass omnidata (<omnidata>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <omnidata>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'omnidata)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-msg:<omnidata> is deprecated: use upperbodycore_msgs-msg:omnidata instead.")))

(cl:ensure-generic-function 'd0-val :lambda-list '(m))
(cl:defmethod d0-val ((m <omnidata>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:d0-val is deprecated.  Use upperbodycore_msgs-msg:d0 instead.")
  (d0 m))

(cl:ensure-generic-function 'd1-val :lambda-list '(m))
(cl:defmethod d1-val ((m <omnidata>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:d1-val is deprecated.  Use upperbodycore_msgs-msg:d1 instead.")
  (d1 m))

(cl:ensure-generic-function 'd2-val :lambda-list '(m))
(cl:defmethod d2-val ((m <omnidata>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:d2-val is deprecated.  Use upperbodycore_msgs-msg:d2 instead.")
  (d2 m))

(cl:ensure-generic-function 'd3-val :lambda-list '(m))
(cl:defmethod d3-val ((m <omnidata>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:d3-val is deprecated.  Use upperbodycore_msgs-msg:d3 instead.")
  (d3 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <omnidata>) ostream)
  "Serializes a message object of type '<omnidata>"
  (cl:let* ((signed (cl:slot-value msg 'd0)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'd1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'd2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'd3)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <omnidata>) istream)
  "Deserializes a message object of type '<omnidata>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'd0) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'd1) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'd2) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'd3) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<omnidata>)))
  "Returns string type for a message object of type '<omnidata>"
  "upperbodycore_msgs/omnidata")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'omnidata)))
  "Returns string type for a message object of type 'omnidata"
  "upperbodycore_msgs/omnidata")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<omnidata>)))
  "Returns md5sum for a message object of type '<omnidata>"
  "7f2caba7690e043b4a97ca92eaf0312e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'omnidata)))
  "Returns md5sum for a message object of type 'omnidata"
  "7f2caba7690e043b4a97ca92eaf0312e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<omnidata>)))
  "Returns full string definition for message of type '<omnidata>"
  (cl:format cl:nil "int16 d0~%int16 d1~%int16 d2~%int16 d3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'omnidata)))
  "Returns full string definition for message of type 'omnidata"
  (cl:format cl:nil "int16 d0~%int16 d1~%int16 d2~%int16 d3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <omnidata>))
  (cl:+ 0
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <omnidata>))
  "Converts a ROS message object to a list"
  (cl:list 'omnidata
    (cl:cons ':d0 (d0 msg))
    (cl:cons ':d1 (d1 msg))
    (cl:cons ':d2 (d2 msg))
    (cl:cons ':d3 (d3 msg))
))
