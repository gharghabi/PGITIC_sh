; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-msg)


;//! \htmlinclude head.msg.html

(cl:defclass <head> (roslisp-msg-protocol:ros-message)
  ((pan
    :reader pan
    :initarg :pan
    :type cl:fixnum
    :initform 0)
   (tilt
    :reader tilt
    :initarg :tilt
    :type cl:fixnum
    :initform 0))
)

(cl:defclass head (<head>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <head>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'head)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-msg:<head> is deprecated: use upperbodycore_msgs-msg:head instead.")))

(cl:ensure-generic-function 'pan-val :lambda-list '(m))
(cl:defmethod pan-val ((m <head>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:pan-val is deprecated.  Use upperbodycore_msgs-msg:pan instead.")
  (pan m))

(cl:ensure-generic-function 'tilt-val :lambda-list '(m))
(cl:defmethod tilt-val ((m <head>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:tilt-val is deprecated.  Use upperbodycore_msgs-msg:tilt instead.")
  (tilt m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <head>) ostream)
  "Serializes a message object of type '<head>"
  (cl:let* ((signed (cl:slot-value msg 'pan)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'tilt)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <head>) istream)
  "Deserializes a message object of type '<head>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pan) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tilt) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<head>)))
  "Returns string type for a message object of type '<head>"
  "upperbodycore_msgs/head")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'head)))
  "Returns string type for a message object of type 'head"
  "upperbodycore_msgs/head")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<head>)))
  "Returns md5sum for a message object of type '<head>"
  "e5401181ff33a9d514daeb8a647b3152")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'head)))
  "Returns md5sum for a message object of type 'head"
  "e5401181ff33a9d514daeb8a647b3152")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<head>)))
  "Returns full string definition for message of type '<head>"
  (cl:format cl:nil "int16 pan~%int16 tilt~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'head)))
  "Returns full string definition for message of type 'head"
  (cl:format cl:nil "int16 pan~%int16 tilt~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <head>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <head>))
  "Converts a ROS message object to a list"
  (cl:list 'head
    (cl:cons ':pan (pan msg))
    (cl:cons ':tilt (tilt msg))
))
