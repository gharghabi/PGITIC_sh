; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-msg)


;//! \htmlinclude arm.msg.html

(cl:defclass <arm> (roslisp-msg-protocol:ros-message)
  ((shoulder_pitch
    :reader shoulder_pitch
    :initarg :shoulder_pitch
    :type cl:fixnum
    :initform 0)
   (shoulder_roll
    :reader shoulder_roll
    :initarg :shoulder_roll
    :type cl:fixnum
    :initform 0)
   (elbow
    :reader elbow
    :initarg :elbow
    :type cl:fixnum
    :initform 0)
   (wrist_pitch
    :reader wrist_pitch
    :initarg :wrist_pitch
    :type cl:fixnum
    :initform 0)
   (wrist_roll
    :reader wrist_roll
    :initarg :wrist_roll
    :type cl:fixnum
    :initform 0))
)

(cl:defclass arm (<arm>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <arm>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'arm)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-msg:<arm> is deprecated: use upperbodycore_msgs-msg:arm instead.")))

(cl:ensure-generic-function 'shoulder_pitch-val :lambda-list '(m))
(cl:defmethod shoulder_pitch-val ((m <arm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:shoulder_pitch-val is deprecated.  Use upperbodycore_msgs-msg:shoulder_pitch instead.")
  (shoulder_pitch m))

(cl:ensure-generic-function 'shoulder_roll-val :lambda-list '(m))
(cl:defmethod shoulder_roll-val ((m <arm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:shoulder_roll-val is deprecated.  Use upperbodycore_msgs-msg:shoulder_roll instead.")
  (shoulder_roll m))

(cl:ensure-generic-function 'elbow-val :lambda-list '(m))
(cl:defmethod elbow-val ((m <arm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:elbow-val is deprecated.  Use upperbodycore_msgs-msg:elbow instead.")
  (elbow m))

(cl:ensure-generic-function 'wrist_pitch-val :lambda-list '(m))
(cl:defmethod wrist_pitch-val ((m <arm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:wrist_pitch-val is deprecated.  Use upperbodycore_msgs-msg:wrist_pitch instead.")
  (wrist_pitch m))

(cl:ensure-generic-function 'wrist_roll-val :lambda-list '(m))
(cl:defmethod wrist_roll-val ((m <arm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:wrist_roll-val is deprecated.  Use upperbodycore_msgs-msg:wrist_roll instead.")
  (wrist_roll m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <arm>) ostream)
  "Serializes a message object of type '<arm>"
  (cl:let* ((signed (cl:slot-value msg 'shoulder_pitch)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'shoulder_roll)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'elbow)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'wrist_pitch)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'wrist_roll)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <arm>) istream)
  "Deserializes a message object of type '<arm>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'shoulder_pitch) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'shoulder_roll) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'elbow) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'wrist_pitch) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'wrist_roll) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<arm>)))
  "Returns string type for a message object of type '<arm>"
  "upperbodycore_msgs/arm")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'arm)))
  "Returns string type for a message object of type 'arm"
  "upperbodycore_msgs/arm")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<arm>)))
  "Returns md5sum for a message object of type '<arm>"
  "8aac345dde980bb2608ac1391f6ee8ef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'arm)))
  "Returns md5sum for a message object of type 'arm"
  "8aac345dde980bb2608ac1391f6ee8ef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<arm>)))
  "Returns full string definition for message of type '<arm>"
  (cl:format cl:nil "int16 shoulder_pitch~%int16 shoulder_roll~%int16 elbow~%int16 wrist_pitch~%int16 wrist_roll~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'arm)))
  "Returns full string definition for message of type 'arm"
  (cl:format cl:nil "int16 shoulder_pitch~%int16 shoulder_roll~%int16 elbow~%int16 wrist_pitch~%int16 wrist_roll~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <arm>))
  (cl:+ 0
     2
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <arm>))
  "Converts a ROS message object to a list"
  (cl:list 'arm
    (cl:cons ':shoulder_pitch (shoulder_pitch msg))
    (cl:cons ':shoulder_roll (shoulder_roll msg))
    (cl:cons ':elbow (elbow msg))
    (cl:cons ':wrist_pitch (wrist_pitch msg))
    (cl:cons ':wrist_roll (wrist_roll msg))
))
