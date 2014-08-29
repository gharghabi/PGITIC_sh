; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-srv)


;//! \htmlinclude set_FaceDetectionSrv-request.msg.html

(cl:defclass <set_FaceDetectionSrv-request> (roslisp-msg-protocol:ros-message)
  ((scalefactor
    :reader scalefactor
    :initarg :scalefactor
    :type cl:float
    :initform 0.0)
   (minNeighbores
    :reader minNeighbores
    :initarg :minNeighbores
    :type cl:integer
    :initform 0)
   (flags
    :reader flags
    :initarg :flags
    :type cl:integer
    :initform 0)
   (minsize
    :reader minsize
    :initarg :minsize
    :type cl:integer
    :initform 0))
)

(cl:defclass set_FaceDetectionSrv-request (<set_FaceDetectionSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <set_FaceDetectionSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'set_FaceDetectionSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<set_FaceDetectionSrv-request> is deprecated: use upperbodycore_msgs-srv:set_FaceDetectionSrv-request instead.")))

(cl:ensure-generic-function 'scalefactor-val :lambda-list '(m))
(cl:defmethod scalefactor-val ((m <set_FaceDetectionSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:scalefactor-val is deprecated.  Use upperbodycore_msgs-srv:scalefactor instead.")
  (scalefactor m))

(cl:ensure-generic-function 'minNeighbores-val :lambda-list '(m))
(cl:defmethod minNeighbores-val ((m <set_FaceDetectionSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:minNeighbores-val is deprecated.  Use upperbodycore_msgs-srv:minNeighbores instead.")
  (minNeighbores m))

(cl:ensure-generic-function 'flags-val :lambda-list '(m))
(cl:defmethod flags-val ((m <set_FaceDetectionSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:flags-val is deprecated.  Use upperbodycore_msgs-srv:flags instead.")
  (flags m))

(cl:ensure-generic-function 'minsize-val :lambda-list '(m))
(cl:defmethod minsize-val ((m <set_FaceDetectionSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:minsize-val is deprecated.  Use upperbodycore_msgs-srv:minsize instead.")
  (minsize m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <set_FaceDetectionSrv-request>) ostream)
  "Serializes a message object of type '<set_FaceDetectionSrv-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'scalefactor))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'minNeighbores)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'flags)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'minsize)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <set_FaceDetectionSrv-request>) istream)
  "Deserializes a message object of type '<set_FaceDetectionSrv-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'scalefactor) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'minNeighbores) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'flags) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'minsize) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<set_FaceDetectionSrv-request>)))
  "Returns string type for a service object of type '<set_FaceDetectionSrv-request>"
  "upperbodycore_msgs/set_FaceDetectionSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_FaceDetectionSrv-request)))
  "Returns string type for a service object of type 'set_FaceDetectionSrv-request"
  "upperbodycore_msgs/set_FaceDetectionSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<set_FaceDetectionSrv-request>)))
  "Returns md5sum for a message object of type '<set_FaceDetectionSrv-request>"
  "c0b48cc6c5eec7403dbb8c9086e2e4a3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'set_FaceDetectionSrv-request)))
  "Returns md5sum for a message object of type 'set_FaceDetectionSrv-request"
  "c0b48cc6c5eec7403dbb8c9086e2e4a3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<set_FaceDetectionSrv-request>)))
  "Returns full string definition for message of type '<set_FaceDetectionSrv-request>"
  (cl:format cl:nil "float64 scalefactor~%int32 minNeighbores~%int32 flags~%int32 minsize~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'set_FaceDetectionSrv-request)))
  "Returns full string definition for message of type 'set_FaceDetectionSrv-request"
  (cl:format cl:nil "float64 scalefactor~%int32 minNeighbores~%int32 flags~%int32 minsize~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <set_FaceDetectionSrv-request>))
  (cl:+ 0
     8
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <set_FaceDetectionSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'set_FaceDetectionSrv-request
    (cl:cons ':scalefactor (scalefactor msg))
    (cl:cons ':minNeighbores (minNeighbores msg))
    (cl:cons ':flags (flags msg))
    (cl:cons ':minsize (minsize msg))
))
;//! \htmlinclude set_FaceDetectionSrv-response.msg.html

(cl:defclass <set_FaceDetectionSrv-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass set_FaceDetectionSrv-response (<set_FaceDetectionSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <set_FaceDetectionSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'set_FaceDetectionSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<set_FaceDetectionSrv-response> is deprecated: use upperbodycore_msgs-srv:set_FaceDetectionSrv-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <set_FaceDetectionSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:result-val is deprecated.  Use upperbodycore_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <set_FaceDetectionSrv-response>) ostream)
  "Serializes a message object of type '<set_FaceDetectionSrv-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <set_FaceDetectionSrv-response>) istream)
  "Deserializes a message object of type '<set_FaceDetectionSrv-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'result) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<set_FaceDetectionSrv-response>)))
  "Returns string type for a service object of type '<set_FaceDetectionSrv-response>"
  "upperbodycore_msgs/set_FaceDetectionSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_FaceDetectionSrv-response)))
  "Returns string type for a service object of type 'set_FaceDetectionSrv-response"
  "upperbodycore_msgs/set_FaceDetectionSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<set_FaceDetectionSrv-response>)))
  "Returns md5sum for a message object of type '<set_FaceDetectionSrv-response>"
  "c0b48cc6c5eec7403dbb8c9086e2e4a3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'set_FaceDetectionSrv-response)))
  "Returns md5sum for a message object of type 'set_FaceDetectionSrv-response"
  "c0b48cc6c5eec7403dbb8c9086e2e4a3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<set_FaceDetectionSrv-response>)))
  "Returns full string definition for message of type '<set_FaceDetectionSrv-response>"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'set_FaceDetectionSrv-response)))
  "Returns full string definition for message of type 'set_FaceDetectionSrv-response"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <set_FaceDetectionSrv-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <set_FaceDetectionSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'set_FaceDetectionSrv-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'set_FaceDetectionSrv)))
  'set_FaceDetectionSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'set_FaceDetectionSrv)))
  'set_FaceDetectionSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_FaceDetectionSrv)))
  "Returns string type for a service object of type '<set_FaceDetectionSrv>"
  "upperbodycore_msgs/set_FaceDetectionSrv")