; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-msg)


;//! \htmlinclude wave_hand.msg.html

(cl:defclass <wave_hand> (roslisp-msg-protocol:ros-message)
  ((right
    :reader right
    :initarg :right
    :type cl:string
    :initform "")
   (left
    :reader left
    :initarg :left
    :type cl:string
    :initform ""))
)

(cl:defclass wave_hand (<wave_hand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <wave_hand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'wave_hand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-msg:<wave_hand> is deprecated: use upperbodycore_msgs-msg:wave_hand instead.")))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <wave_hand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:right-val is deprecated.  Use upperbodycore_msgs-msg:right instead.")
  (right m))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <wave_hand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:left-val is deprecated.  Use upperbodycore_msgs-msg:left instead.")
  (left m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <wave_hand>) ostream)
  "Serializes a message object of type '<wave_hand>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'right))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'left))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <wave_hand>) istream)
  "Deserializes a message object of type '<wave_hand>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'right) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'left) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<wave_hand>)))
  "Returns string type for a message object of type '<wave_hand>"
  "upperbodycore_msgs/wave_hand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'wave_hand)))
  "Returns string type for a message object of type 'wave_hand"
  "upperbodycore_msgs/wave_hand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<wave_hand>)))
  "Returns md5sum for a message object of type '<wave_hand>"
  "fb70fdb6be4aa5bc20f6e3252e838457")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'wave_hand)))
  "Returns md5sum for a message object of type 'wave_hand"
  "fb70fdb6be4aa5bc20f6e3252e838457")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<wave_hand>)))
  "Returns full string definition for message of type '<wave_hand>"
  (cl:format cl:nil "string right~%string left~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'wave_hand)))
  "Returns full string definition for message of type 'wave_hand"
  (cl:format cl:nil "string right~%string left~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <wave_hand>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'right))
     4 (cl:length (cl:slot-value msg 'left))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <wave_hand>))
  "Converts a ROS message object to a list"
  (cl:list 'wave_hand
    (cl:cons ':right (right msg))
    (cl:cons ':left (left msg))
))
