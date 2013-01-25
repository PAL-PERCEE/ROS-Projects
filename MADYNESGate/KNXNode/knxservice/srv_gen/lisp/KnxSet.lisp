; Auto-generated. Do not edit!


(cl:in-package knxservice-srv)


;//! \htmlinclude KnxSet-request.msg.html

(cl:defclass <KnxSet-request> (roslisp-msg-protocol:ros-message)
  ((action
    :reader action
    :initarg :action
    :type cl:string
    :initform "")
   (target
    :reader target
    :initarg :target
    :type cl:string
    :initform "")
   (value
    :reader value
    :initarg :value
    :type cl:integer
    :initform 0))
)

(cl:defclass KnxSet-request (<KnxSet-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <KnxSet-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'KnxSet-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name knxservice-srv:<KnxSet-request> is deprecated: use knxservice-srv:KnxSet-request instead.")))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <KnxSet-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader knxservice-srv:action-val is deprecated.  Use knxservice-srv:action instead.")
  (action m))

(cl:ensure-generic-function 'target-val :lambda-list '(m))
(cl:defmethod target-val ((m <KnxSet-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader knxservice-srv:target-val is deprecated.  Use knxservice-srv:target instead.")
  (target m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <KnxSet-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader knxservice-srv:value-val is deprecated.  Use knxservice-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <KnxSet-request>) ostream)
  "Serializes a message object of type '<KnxSet-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'action))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'action))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'target))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'target))
  (cl:let* ((signed (cl:slot-value msg 'value)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <KnxSet-request>) istream)
  "Deserializes a message object of type '<KnxSet-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'action) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'target) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'target) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<KnxSet-request>)))
  "Returns string type for a service object of type '<KnxSet-request>"
  "knxservice/KnxSetRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'KnxSet-request)))
  "Returns string type for a service object of type 'KnxSet-request"
  "knxservice/KnxSetRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<KnxSet-request>)))
  "Returns md5sum for a message object of type '<KnxSet-request>"
  "a52063543f07e0ff1e50cfc319531f85")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'KnxSet-request)))
  "Returns md5sum for a message object of type 'KnxSet-request"
  "a52063543f07e0ff1e50cfc319531f85")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<KnxSet-request>)))
  "Returns full string definition for message of type '<KnxSet-request>"
  (cl:format cl:nil "string action~%string target~%int64 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'KnxSet-request)))
  "Returns full string definition for message of type 'KnxSet-request"
  (cl:format cl:nil "string action~%string target~%int64 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <KnxSet-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'action))
     4 (cl:length (cl:slot-value msg 'target))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <KnxSet-request>))
  "Converts a ROS message object to a list"
  (cl:list 'KnxSet-request
    (cl:cons ':action (action msg))
    (cl:cons ':target (target msg))
    (cl:cons ':value (value msg))
))
;//! \htmlinclude KnxSet-response.msg.html

(cl:defclass <KnxSet-response> (roslisp-msg-protocol:ros-message)
  ((etat
    :reader etat
    :initarg :etat
    :type cl:string
    :initform "")
   (xml
    :reader xml
    :initarg :xml
    :type cl:string
    :initform ""))
)

(cl:defclass KnxSet-response (<KnxSet-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <KnxSet-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'KnxSet-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name knxservice-srv:<KnxSet-response> is deprecated: use knxservice-srv:KnxSet-response instead.")))

(cl:ensure-generic-function 'etat-val :lambda-list '(m))
(cl:defmethod etat-val ((m <KnxSet-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader knxservice-srv:etat-val is deprecated.  Use knxservice-srv:etat instead.")
  (etat m))

(cl:ensure-generic-function 'xml-val :lambda-list '(m))
(cl:defmethod xml-val ((m <KnxSet-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader knxservice-srv:xml-val is deprecated.  Use knxservice-srv:xml instead.")
  (xml m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <KnxSet-response>) ostream)
  "Serializes a message object of type '<KnxSet-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'etat))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'etat))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'xml))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'xml))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <KnxSet-response>) istream)
  "Deserializes a message object of type '<KnxSet-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'etat) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'etat) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'xml) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'xml) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<KnxSet-response>)))
  "Returns string type for a service object of type '<KnxSet-response>"
  "knxservice/KnxSetResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'KnxSet-response)))
  "Returns string type for a service object of type 'KnxSet-response"
  "knxservice/KnxSetResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<KnxSet-response>)))
  "Returns md5sum for a message object of type '<KnxSet-response>"
  "a52063543f07e0ff1e50cfc319531f85")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'KnxSet-response)))
  "Returns md5sum for a message object of type 'KnxSet-response"
  "a52063543f07e0ff1e50cfc319531f85")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<KnxSet-response>)))
  "Returns full string definition for message of type '<KnxSet-response>"
  (cl:format cl:nil "string etat~%string xml~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'KnxSet-response)))
  "Returns full string definition for message of type 'KnxSet-response"
  (cl:format cl:nil "string etat~%string xml~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <KnxSet-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'etat))
     4 (cl:length (cl:slot-value msg 'xml))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <KnxSet-response>))
  "Converts a ROS message object to a list"
  (cl:list 'KnxSet-response
    (cl:cons ':etat (etat msg))
    (cl:cons ':xml (xml msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'KnxSet)))
  'KnxSet-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'KnxSet)))
  'KnxSet-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'KnxSet)))
  "Returns string type for a service object of type '<KnxSet>"
  "knxservice/KnxSet")