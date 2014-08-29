; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-srv)


;//! \htmlinclude FaceTrackingSrv-request.msg.html

(cl:defclass <FaceTrackingSrv-request> (roslisp-msg-protocol:ros-message)
  ((request_tr
    :reader request_tr
    :initarg :request_tr
    :type cl:boolean
    :initform cl:nil)
   (nearest
    :reader nearest
    :initarg :nearest
    :type cl:boolean
    :initform cl:nil)
   (id_tr_flag
    :reader id_tr_flag
    :initarg :id_tr_flag
    :type cl:boolean
    :initform cl:nil)
   (id_tr
    :reader id_tr
    :initarg :id_tr
    :type cl:integer
    :initform 0))
)

(cl:defclass FaceTrackingSrv-request (<FaceTrackingSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FaceTrackingSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FaceTrackingSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<FaceTrackingSrv-request> is deprecated: use upperbodycore_msgs-srv:FaceTrackingSrv-request instead.")))

(cl:ensure-generic-function 'request_tr-val :lambda-list '(m))
(cl:defmethod request_tr-val ((m <FaceTrackingSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:request_tr-val is deprecated.  Use upperbodycore_msgs-srv:request_tr instead.")
  (request_tr m))

(cl:ensure-generic-function 'nearest-val :lambda-list '(m))
(cl:defmethod nearest-val ((m <FaceTrackingSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:nearest-val is deprecated.  Use upperbodycore_msgs-srv:nearest instead.")
  (nearest m))

(cl:ensure-generic-function 'id_tr_flag-val :lambda-list '(m))
(cl:defmethod id_tr_flag-val ((m <FaceTrackingSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:id_tr_flag-val is deprecated.  Use upperbodycore_msgs-srv:id_tr_flag instead.")
  (id_tr_flag m))

(cl:ensure-generic-function 'id_tr-val :lambda-list '(m))
(cl:defmethod id_tr-val ((m <FaceTrackingSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:id_tr-val is deprecated.  Use upperbodycore_msgs-srv:id_tr instead.")
  (id_tr m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FaceTrackingSrv-request>) ostream)
  "Serializes a message object of type '<FaceTrackingSrv-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'request_tr) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'nearest) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'id_tr_flag) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'id_tr)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FaceTrackingSrv-request>) istream)
  "Deserializes a message object of type '<FaceTrackingSrv-request>"
    (cl:setf (cl:slot-value msg 'request_tr) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'nearest) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'id_tr_flag) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id_tr) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FaceTrackingSrv-request>)))
  "Returns string type for a service object of type '<FaceTrackingSrv-request>"
  "upperbodycore_msgs/FaceTrackingSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FaceTrackingSrv-request)))
  "Returns string type for a service object of type 'FaceTrackingSrv-request"
  "upperbodycore_msgs/FaceTrackingSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FaceTrackingSrv-request>)))
  "Returns md5sum for a message object of type '<FaceTrackingSrv-request>"
  "839fae58f33f4317a0f5824a6118c798")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FaceTrackingSrv-request)))
  "Returns md5sum for a message object of type 'FaceTrackingSrv-request"
  "839fae58f33f4317a0f5824a6118c798")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FaceTrackingSrv-request>)))
  "Returns full string definition for message of type '<FaceTrackingSrv-request>"
  (cl:format cl:nil "bool request_tr~%bool nearest~%bool id_tr_flag~%int32 id_tr~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FaceTrackingSrv-request)))
  "Returns full string definition for message of type 'FaceTrackingSrv-request"
  (cl:format cl:nil "bool request_tr~%bool nearest~%bool id_tr_flag~%int32 id_tr~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FaceTrackingSrv-request>))
  (cl:+ 0
     1
     1
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FaceTrackingSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'FaceTrackingSrv-request
    (cl:cons ':request_tr (request_tr msg))
    (cl:cons ':nearest (nearest msg))
    (cl:cons ':id_tr_flag (id_tr_flag msg))
    (cl:cons ':id_tr (id_tr msg))
))
;//! \htmlinclude FaceTrackingSrv-response.msg.html

(cl:defclass <FaceTrackingSrv-response> (roslisp-msg-protocol:ros-message)
  ((resule
    :reader resule
    :initarg :resule
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass FaceTrackingSrv-response (<FaceTrackingSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FaceTrackingSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FaceTrackingSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<FaceTrackingSrv-response> is deprecated: use upperbodycore_msgs-srv:FaceTrackingSrv-response instead.")))

(cl:ensure-generic-function 'resule-val :lambda-list '(m))
(cl:defmethod resule-val ((m <FaceTrackingSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:resule-val is deprecated.  Use upperbodycore_msgs-srv:resule instead.")
  (resule m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FaceTrackingSrv-response>) ostream)
  "Serializes a message object of type '<FaceTrackingSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'resule) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FaceTrackingSrv-response>) istream)
  "Deserializes a message object of type '<FaceTrackingSrv-response>"
    (cl:setf (cl:slot-value msg 'resule) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FaceTrackingSrv-response>)))
  "Returns string type for a service object of type '<FaceTrackingSrv-response>"
  "upperbodycore_msgs/FaceTrackingSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FaceTrackingSrv-response)))
  "Returns string type for a service object of type 'FaceTrackingSrv-response"
  "upperbodycore_msgs/FaceTrackingSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FaceTrackingSrv-response>)))
  "Returns md5sum for a message object of type '<FaceTrackingSrv-response>"
  "839fae58f33f4317a0f5824a6118c798")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FaceTrackingSrv-response)))
  "Returns md5sum for a message object of type 'FaceTrackingSrv-response"
  "839fae58f33f4317a0f5824a6118c798")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FaceTrackingSrv-response>)))
  "Returns full string definition for message of type '<FaceTrackingSrv-response>"
  (cl:format cl:nil "bool resule~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FaceTrackingSrv-response)))
  "Returns full string definition for message of type 'FaceTrackingSrv-response"
  (cl:format cl:nil "bool resule~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FaceTrackingSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FaceTrackingSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'FaceTrackingSrv-response
    (cl:cons ':resule (resule msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'FaceTrackingSrv)))
  'FaceTrackingSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'FaceTrackingSrv)))
  'FaceTrackingSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FaceTrackingSrv)))
  "Returns string type for a service object of type '<FaceTrackingSrv>"
  "upperbodycore_msgs/FaceTrackingSrv")