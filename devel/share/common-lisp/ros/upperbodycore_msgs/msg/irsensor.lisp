; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-msg)


;//! \htmlinclude irsensor.msg.html

(cl:defclass <irsensor> (roslisp-msg-protocol:ros-message)
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
    :initform 0)
   (d4
    :reader d4
    :initarg :d4
    :type cl:fixnum
    :initform 0)
   (d5
    :reader d5
    :initarg :d5
    :type cl:fixnum
    :initform 0)
   (d6
    :reader d6
    :initarg :d6
    :type cl:fixnum
    :initform 0)
   (d7
    :reader d7
    :initarg :d7
    :type cl:fixnum
    :initform 0))
)

(cl:defclass irsensor (<irsensor>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <irsensor>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'irsensor)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-msg:<irsensor> is deprecated: use upperbodycore_msgs-msg:irsensor instead.")))

(cl:ensure-generic-function 'd0-val :lambda-list '(m))
(cl:defmethod d0-val ((m <irsensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:d0-val is deprecated.  Use upperbodycore_msgs-msg:d0 instead.")
  (d0 m))

(cl:ensure-generic-function 'd1-val :lambda-list '(m))
(cl:defmethod d1-val ((m <irsensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:d1-val is deprecated.  Use upperbodycore_msgs-msg:d1 instead.")
  (d1 m))

(cl:ensure-generic-function 'd2-val :lambda-list '(m))
(cl:defmethod d2-val ((m <irsensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:d2-val is deprecated.  Use upperbodycore_msgs-msg:d2 instead.")
  (d2 m))

(cl:ensure-generic-function 'd3-val :lambda-list '(m))
(cl:defmethod d3-val ((m <irsensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:d3-val is deprecated.  Use upperbodycore_msgs-msg:d3 instead.")
  (d3 m))

(cl:ensure-generic-function 'd4-val :lambda-list '(m))
(cl:defmethod d4-val ((m <irsensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:d4-val is deprecated.  Use upperbodycore_msgs-msg:d4 instead.")
  (d4 m))

(cl:ensure-generic-function 'd5-val :lambda-list '(m))
(cl:defmethod d5-val ((m <irsensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:d5-val is deprecated.  Use upperbodycore_msgs-msg:d5 instead.")
  (d5 m))

(cl:ensure-generic-function 'd6-val :lambda-list '(m))
(cl:defmethod d6-val ((m <irsensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:d6-val is deprecated.  Use upperbodycore_msgs-msg:d6 instead.")
  (d6 m))

(cl:ensure-generic-function 'd7-val :lambda-list '(m))
(cl:defmethod d7-val ((m <irsensor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:d7-val is deprecated.  Use upperbodycore_msgs-msg:d7 instead.")
  (d7 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <irsensor>) ostream)
  "Serializes a message object of type '<irsensor>"
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
  (cl:let* ((signed (cl:slot-value msg 'd4)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'd5)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'd6)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'd7)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <irsensor>) istream)
  "Deserializes a message object of type '<irsensor>"
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
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'd4) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'd5) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'd6) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'd7) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<irsensor>)))
  "Returns string type for a message object of type '<irsensor>"
  "upperbodycore_msgs/irsensor")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'irsensor)))
  "Returns string type for a message object of type 'irsensor"
  "upperbodycore_msgs/irsensor")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<irsensor>)))
  "Returns md5sum for a message object of type '<irsensor>"
  "5bc545fa276d41dab37b84fc4b75e375")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'irsensor)))
  "Returns md5sum for a message object of type 'irsensor"
  "5bc545fa276d41dab37b84fc4b75e375")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<irsensor>)))
  "Returns full string definition for message of type '<irsensor>"
  (cl:format cl:nil "int16 d0~%int16 d1~%int16 d2~%int16 d3~%int16 d4~%int16 d5~%int16 d6~%int16 d7~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'irsensor)))
  "Returns full string definition for message of type 'irsensor"
  (cl:format cl:nil "int16 d0~%int16 d1~%int16 d2~%int16 d3~%int16 d4~%int16 d5~%int16 d6~%int16 d7~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <irsensor>))
  (cl:+ 0
     2
     2
     2
     2
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <irsensor>))
  "Converts a ROS message object to a list"
  (cl:list 'irsensor
    (cl:cons ':d0 (d0 msg))
    (cl:cons ':d1 (d1 msg))
    (cl:cons ':d2 (d2 msg))
    (cl:cons ':d3 (d3 msg))
    (cl:cons ':d4 (d4 msg))
    (cl:cons ':d5 (d5 msg))
    (cl:cons ':d6 (d6 msg))
    (cl:cons ':d7 (d7 msg))
))
