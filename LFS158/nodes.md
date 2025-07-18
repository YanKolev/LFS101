# Introduction to Kubernetes (LFS158)

### 1. Introduction

### 2. From Monolith to Microservices

### 3. Container Orchestration

### 4. Kubernetes

### 5. Kubernetes Achitecture

### 6. Installing Kubernetes

### 7. Minikube: Installing local Kuberneets Clusters

### 8. Accessing Minikube

### 9. Kubernetes Building Blocks

### 10. Authentication, Authorization, Admision control

### 11. Services

### 12. Deploy Standalone application

### 13. Kubernetes Volume management

### 14. Configmaps And Secrets

### 15. Ingress

### 16. Advanced Topics

---

---

### 1. Introduction

---

**Overview**

- beginning to use Kubernetes for container orchestration who need guidelines on how to start transforming their organization with Kubernetes and cloud native patterns.

---

### 2. From Monolith to Microservices

---

**Overview**

- What is a Monolith? - Being a large, single piece of software which continuously grows, it has to run on a single system which has to satisfy its compute, memory, storage, and networking requirements. The hardware of such capacity is not only complex and extremely pricey, but at times challenging to procure.

- Since the entire monolith application runs as a single process, the scaling of individual features of the monolith is almost impossible. It internally supports a hardcoded number of connections and operations. However, scaling the entire application can be achieved by manually deploying a new instance of the monolith on another server, typically behind a load balancing appliance - another pricey solution.

- During upgrades, patches or migrations of the monolith application downtime is inevitable and maintenance windows have to be planned well in advance as disruptions in service are expected to impact clients. While there are third party solutions to minimize downtime to customers by setting up monolith applications in a highly available active/passive configuration, they introduce new challenges for system engineers to keep all systems at the same patch level and may introduce new possible licensing costs.

---

- Microservices: (Modern way of chopping into pieces a large infrastructure with a modular approach) - Microservices can be deployed individually on separate servers provisioned with fewer resources - only what is required by each service and the host system itself, helping to lower compute resource expenses.

- Microservices-based architecture is aligned with Event-driven Architecture and Service-Oriented Architecture (SOA) principles, where complex applications are composed of small independent processes which communicate with each other through Application Programming Interfaces (APIs) over a network. APIs allow access by other internal services of the same application or external, third-party services and applications.

---

### 3. Container Orchestration

---

**Overview**

- Container images allow us to confine the application code, its runtime, and all of its dependencies in a pre-defined format. The container runtimes like runC, containerd, or cri-o can use pre-packaged images as a source to create and run one or more containers. These runtimes are capable of running containers on a single host, however, in practice, we would like to have a fault-tolerant and scalable solution, achieved by building a single controller/management unit, a collection of multiple hosts connected together. This controller/management unit is generally referred to as a container orchestrator.

---

**Container Orchestration**

- What is a Container? - They are application-centric method to deliver high-performing, scalable application on any infrastructure of your choice. Containers are best suited to deliver microservicesby providing portable, isolated virtual environments for applications to run without interference from other running applications.

![](images/containers.png)

- Microservices are lightweight application written in various programming language with specific dependencies, libraries and environmental requirements. To ensure that application has everything it needs to run successfully it is packaged together with its dependencies.

- Containers encapsulate microservices and their dependencies byt do not run them dirrectly. Containers run container images.

- A container image bundles the application along with its runtime, libraries, and dependencies. and it represents the source of a container deployed to offer an isolated executable enviroment for the application. Containers can be deployed from a specific image on many platforms, such as workstations, VMs, public cloud... etc.

---

**Container Orchestration**

- In Dev environments, running containers on a single host for development and testing of applications may be suitable option. However, when migrating on to a QA and PROD environments, that is no longer viable option because the applications nad services need to meet specific requirements:

  - fault tolerance,
  - on-demand scalability
  - optimal resource usage
  - auto-discovery to automatically discover and communicate with each other
  - accessibility from the outside world
  - seamless updates/rollbacks without any downtime

- Container orchestrators are tools which group systems together to form clusters where containers deployment and management is automated at scale while meeting the requirements. Those clustered systems confer the advantages of distributed systems, such as increase in- performance, efficiency, reliability, workload distribution and reduced latency.

- There are many container orchestration tools: Amazon Elastic Container, Azure Container instances, Azure Service Fabric, Kubernetes, Nomad, Docker swarm.

- Why we use them? - we can manually maintain a couple of containers or write scripts to manage the lifecycle of dozens of containers, orchestrators make things much easier for users especially when it comes to managing hundreds or thousands of containers running on a global infrastructure.

- With container orcestrators we can:

  - Group hosts together while creating a cluster, in order to leverage the benefits of distributed systems.
  - Schedule containers to run on hosts in the cluster based on resources availability.
  - Enable containers in a cluster to communicate with each other regardless of the host they are deployed to in the cluster.
  - Bind containers and storage resources.
  - Group sets of similar containers and bind them to load-balancing constructs to simplify access to containerized applications by creating an interface, a level of abstraction between the containers and the client.
  - Manage and optimize resource usage.
  - Allow for implementation of policies to secure access to applications running inside containers.

- Deployment of Container Orchestration: Most container orchestrators can be deployed on the infrastructure of our choice - on bare metal, Virtual Machines, on-premises, on public and hybrid clouds. Kubernetes, for example, can be deployed on a workstation, with or without an isolation layer such as a local hypervisor or container runtime, inside a company's data center, in the cloud on AWS Elastic Compute Cloud (EC2) instances, Google Compute Engine (GCE) VMs, DigitalOcean Droplets, IBM Virtual Servers, OpenStack, etc.

- In addition, there are turnkey cloud solutions which allow production Kubernetes clusters to be installed, with only a few commands, on top of cloud Infrastructures-as-a-Service. These solutions paved the way for the managed container orchestration as-a-Service, more specifically the managed Kubernetes as-a-Service (KaaS) solution, offered and hosted by the major cloud providers.

---

### 4. Kubernetes

---

![](images/kubernetes.png)
**Overview**

- What is Kubernetes? - Open-source system for automating deployment, scaling and management of containerized appliactions.

- called also k8s, inspired by Googl'es Borg system > a container and workload orchestrator for its global operations. Writen in Go.

- . Several features/objects of Kubernetes that can be traced back to Borg, or to lessons learned from it, are:

  - API servers
  - Pods
  - IP-per-Pod
  - Services
  - Labels.

---

**Kubernetes Features**

1. Automatic bin packing
   Kubernetes automatically schedules containers based on resource needs and constraints, to maximize utilization without sacrificing availability.
2. Designed for extensibility
   A Kubernetes cluster can be extended with new custom features without modifying the upstream source code.
3. Self-healing
   Kubernetes automatically replaces and reschedules containers from failed nodes. It terminates and then restarts containers that become unresponsive to health checks, based on existing rules/policy. It also prevents traffic from being routed to unresponsive containers.
4. Horizontal scaling
   Kubernetes scales applications manually or automatically based on CPU or custom metrics utilization.
5. Service discovery and load balancing
   Containers receive IP addresses from Kubernetes, while it assigns a single Domain Name System (DNS) name to a set of containers to aid in load-balancing requests across the containers of the set.

6. Automated rollouts and rollbacks
   Kubernetes seamlessly rolls out and rolls back application updates and configuration changes, constantly monitoring the application's health to prevent any downtime.
7. Secret and configuration management
   Kubernetes manages sensitive data and configuration details for an application separately from the container image, in order to avoid a rebuild of the respective image. Secrets consist of sensitive/confidential information passed to the application without revealing the sensitive content to the stack configuration, like on GitHub.
8. Storage orchestration
   Kubernetes automatically mounts software-defined storage (SDS) solutions to containers from local storage, external cloud providers, distributed storage, or network storage systems.
9. Batch execution
   Kubernetes supports batch execution, long-running jobs, and replaces failed containers.
10. IPv4/IPv6 dual-stack
    Kubernetes supports both IPv4 and IPv6 addresses.

- Additional Features: Kubernetes supports common Platform as a Service specific features such as application deployment, scaling, and load balancing, but allows users to integrate their desired monitoring, logging and alerting solutions through optional plugins.

- For example, support for role-based access control (RBAC) is stable only as of the Kubernetes 1.8 release, while cronjob support is stable only as of release 1.21.

- **NB!** One of the main strengths- portability. It can be deployed in many environments such as local or remote Virtual Machines, bare metal, or in public/private/hybrid/multi-cloud setups.

---

---

---

### 5. Kubernetes Achitecture

---

---

---

**Kubernetes Cluster Architecture**

- Kubernetes Architecture can be described as: cluster of compute systems ategorized by their distinct roles

- 1. One or more control plane.
- 2. One or more worker nodes (optional but recommended)

- Components of Kubernetes Cluster:

![](images/kubernetescluster.png)

---

---

**Control Plane Node**

- provides a running environment for the control plane agents responsible for managing the state of a Kubernete cluster, and its braind behind all oprations inside the cluster. The control plane components are agent with very distict roles in the cluster's management. In order to communicate with k8s cluster > user sends requests to the control plane >CLI tool/web UI/API.

- **Important to keep control plane running at all costs.** Losing control plane may introduce downtime, causing service disruption to clients with possible loss of business. To ensure such fault tolerance we need to have control plane node replicas. They need to be configured in High-availabilit(HA) mode.

- Only one of the control plane nodes is dedicated to actively managing the cluster, the control plane components stay in sync across the control plane node replicas. This type of configuration adds resiliency to the cluster's control plane, should the active control plane node fail.

- To make the Kubernetes cluster state persistent-> all cluster configuratio data is saved to a istributed key-value store which only holds cluster state related data, no client workload generated data.

- The key-value store may be configured on the conrol plane (stacked topology) or on its dedicated host (external topology) to help reduce the chances of data store loss by decoupling i from the other control plane agents.

- In the stacked key-value store topology, HA control plane replicas ensure the key-value store's resilency as well. However that is not the case with external key-value store topology where the dedicated key-value store hosts have to be separately repolicated for HA, a configuration that introduces the need for additional hardware- > additional operational costs.

---

---

**Control Plane Node Components**

- control plane node runs the following essential control plane components and agents: API server, scheduler, controller managers and key-value store.

- control plane node runs- container rintime, node agent (kubelet), proxy (kube-proxy), optional add-ons for observability- dashboard, cluster level monitoring, and logging.

---

- **API SERVER**

---

- All administarative tasks are coordinated by the kube-apiserver, a central control plane component runing on the control plane node.

- The API server intercepts RESTful calls from users, administrators, developers, operators and external agents, then validates and processes them. During processing the API server reads the K8s cluster's current state from the key-value store, and after a call's execution the resilting state of the k8s cluster is saved in the key-value store for persistence.

- The API server is the oncrol control plane component to talk to the key- value store. both to read from and to save kubernetes cluster state information > acting as a middle interface for any other control plane agent inquiring about the cluster's state.

- The API server is highly configurable and customizable. It can scale horizontally, but it also supports the addition of custom secondary API servers, a configuration that transfors the primary API server into a proxy to all secondary, custom API server, routing all incoming RESTFUL calls to them based on custom defined rules.

---

- **Scheduler**

- The role of the kube-scheduler is to assign new workload objects, such as pods encapsulating containers, to nodes- typically worker nodes. Duging the scheduling process, decisions are made based on current Kubernetes cluster state and new workload object's requirements.

- The schedulers obtains from the key-value store, vi a the API server, resource usage data for each worker node in the cluster. The scheduler also receives from the API server the new workload object's requirements which are part o its configuration data. Requirements may include contstraints that users and operators set, such as scheduling work on a node labeled with disk==ssd key-value pair.

- The scheduer also takes n account QoS(Quality of Service) requirements, data locality, affinity, anti-affinity, taints, tolration, cluster topology, etc. Once all the cluster data is available the scheduling algorithm filters the nodes with predicates to isolate the possible node candidates which then are scored with priorities in order to select the one node that satisfies all requirements for hosting the new workload. The outcome of the decision process is communicated back to the API server, which den deelgates the workload deployment with other control plane agents.

- The scheduler is highly configurable and customizable through schduling polcies, plugins and profiles. Additional custome schedulers are also supported, then the objects configuraton data should include the name of the custome schduler expected to make the schduling decision for that particular object, if no such data is include the default schduler is selected instead.

- A scheduler is extremely important and complex in multi-node Kubernetes cluster, while in a sngle-node Kubernetes cluster possibly used for learning and development purposes, the scheduler job is quite simple.

---

**Controller managers**

- Controller managers are components of the control plane node running controllers or operator processes to regulate the state of the K8s cluster. Controllers are watch loop processes continuously running and comparing the cluster's desired state( provided by objects configuration data) with its current state (obtained from the key-value store via the API server). In case of mismatch, corrective action is taken in the cluster until its current state matches the desired state.

- The kube-controller-manager runs controllers or operators responsible to act when nodes become unavailable, to ensure container pod counts are as expected to create endpoints, service accounts and API access tokens.

- The cloud-controller manager runs- controllers or operators responsible to interact wit hthe underlying infrastructure of a cloud provider when nodes become unavailable to manage storage volumes when provided by a cloud service and to manage a load balancing and routing.

---

**Key-Value data store**

- **etcd** is open source project under CNCF. etcd is a strongly consistent, distributed key-value data store used to persist a Kubernetes cluster's state. New data is written to the data store only by appending to it, data is never replaced in the data store. Obsolete data is compacted or shredded periodically to minimize the sie of the data store.

- out of all control plane components, only the API server is able to communicate with the etcd data store.

- etcd's CLI management tool- edcdctl, provides snapshot save and restore capabilities which come n handly especially for a single etcd instance Kubernetes cluster- common in development and learning environments. However in stage nad production environments, it is extremely important to replicate the data stors in HA mode for cluster configuration data resiliency.

- Some Kubernetes cluster bootstrapping tools, such as kubeadm, by default provision stacked etcd control plane nodes, where the data store runs alongside and shares resources with the other control plane components on the same control plane node.

![](images/stackedetcd.png)

- For data isolation from the control plane components, the bootstrapping process can be configured for an external etcd topology, where the data store is provisioned on a dedicated separate host, this reducing the cahnces of an etcd failure.

![](images/externaletcd.png)

- Both Stacked and external etcd topologies support HA configurations. etcd is based on the RAFT consensus Algo > which allows a collection of mahines to work as a coherent group that can survive the failures of some of its memebrs. ANy given time, one of the nodes in the group wil be the leader and the rest of them will be followers.

- etcd handles leader elections and can tolerate node failure, including leader node failures. Any node can be treated as a leader.

- The leader/followers hierarchy is distinct fomr the primary/secondary hierarchy meaning that neither node is favored for the leader role and neither node outrands other nodes. A leader will remain active until it fails at which point in time a new leader is elected by the group of healthy followers.

![](images/leaderfollower.png)

---

**Worker Node Overview**

- worker node provide a running environment for client applicatios. These apps are microservices running as application containers. In k8s the application container are encapsulated in PODS, controlled by the cluster control plane agent running on the control plane nodes.

- Pods are schedulerd on worker nodes, where they find required compute, memory and storage resources to run, and networking to talk to each other and the outside worlds. A pod is the smalled scheduling work unit in K8s. It is a logical collection of one or more container schdeculed together nad the collection can be started, stopped or rescheduled as a single unit of work.

- In a multi-worker Kubernetes cluster, the network traffic between client users and the containerized applications deployed in PODS is handled directly by the worker nodes, and its not routed through the control plane node.

---

**Worker Node Components**

- A worker node has the following components, contaiainer runtime, node agent- kubelet, kubelet-CIR shims, proxy- kube-proxy and add-ons (for DS, observability components> dashboards, cluster-level monitoring and logging and device plugins).

- Container Runtime: k8s is described as "container orchestration engine" it lacks the capability to directly handle nad run containers. In order to managea containr's lifecycles Kubernetes requires a container runtime on the node where a pod and its container are to be scheduled. A runtime is required on each node of a k8s cluster, both control plane and worker.

- Recommendntation is run the K8s control plane coponents as containers, hence the necessity of a runtime on the control plane nodes. k8s supports- CRI-O, containerd, Docker engine, Mirantis Container Runtime.

---

**Node agent- kubelet**

- The kubelet is an agent running on each node, contro plane and workers and it communicates with the control plane. It recieves POD definitions, primarily from the API server and interacts with the container runtime on the node to run containers associated with the POD. It also monitos the health and resources of pods running containers.

- The Kubelet connects to container runtimes through a plugin based interface- the Container Runtime interface (CRI). CRI consists of protocl buffers , gRPC API, libraries and addtional specification and tools in order to connect to interchangeable container runtimes, kubelet uses a CRI shim- an application which provides a clear abstaction layer between kubelet and the container runtime.

- Container runtime interface diagram:

![](images/CRI.png)

- The kubelet acting as grpc client connects to the CRI shim acting as grpc server to perform container and image operations. The CRI implements two services: ImageService and RuntimeService. The ImageService is responsible for all image-related operations, while the RuntimeService is responsible for all pod and container-related operations.

---

**kubelet- CRI shims**

- Originally the kubelet agent supported only a couple of container runtimes, first Docker Engine, followed by rkt, through a unique interface model integrated directly in the kubelet source code. However, this approach was not intended to last forever even thugh it was especially beneficial for docker. After tht k8s migrated to CRI- a flexible method to integrate with various container runtimes without the need to recompile its source code.

- Shims are Container Runtime Interface (CRI) implementations, interfaces or adapters, specifi to each ocntainer runtime supported by K8s.

---

**cri-containerd**

- cri-containerd allows containers to be directly created and managed with containerd at kubelet's request

![](images/CRI-containerd.png)

**CRI-O**

- CRI-O enables the use of any Open Container Initiative (OCI) compatible runtime with k8s, such as runC:

![](images/CRI-O.png)

**dockershim and cri-dockerd**

- before later k8s update, the dockershim allowed containers to be created and managed by invoking the Docker Engine and its internal runtime containerd. Due to Docker Engine's popularity, this shim was the default. after modern updates the dockershim is no longer maintained by the k8s project, its specific code is removed from the kubelet source code, thus will no longer be supported by the kubelet node agent of k8s.

- As a result, Docker, Inc., and Mirantis have agreed to introduce and maintain a replacement adapter, cri-dockerd that would ensure that the Docker Engine will continue to be a container runtime option for Kubernetes, in addition to the Mirantis Container Runtime (MCR). The introduction of cri-dockerd also ensures that both Docker Engine and MCR follow the same standardized integration method as the CRI-compatible runtimes.

![](images/dockershim.png)

---

**Proxy- kube-proxy**

- Kube-proxy network agent whch runs on each node, control plane nd workers, responsible for dynami updates and maintenance of all networking rules on the node. it abstracts the details of pods networking and forwards connection requests to the containers in the Pods.

-Kube-proxy is responsible for TCP, UDP and SCTP stream forwarding on random forwarding across a set of POD backends of an application and its implements forwarding rules defined by users through Service API objects.

- Kube-proxy node agent operates in conjunction with the iptables of the node. Iptables is a firewall utinility created for the linux os that can be managed by users via CLI.

---

**ADD-ONS**

- Add-ons are cluster features and functionality not yet available in k8s and therefore we need 3rd pary plugs and services.

- DNS, Dashboard, Monitoring, Logging, Device Plugins.

---

**Networking CHallenges**

- Decoupled microservices based applications rely heavily on networking in order to mimic the tight-coupling once available in the monolithic era. As conetainerized microservices orchestrator it needs to address a few distinct networking challenges:

      - container to container communication inside pods.
      - pod to pod communiation on the same node and acrss cluster nodes
      - service to pod communication within the same namespace and across cluster namespaces
      - external to service communication for clients to access applications in a cluster.

- all of these challenges must be addressed by a kubernetes cluster and its plugins.

**Container-to- Container** communication inside pods:

- making use of the underlying host operating system's kernel virtualization features, a container runtime creates an isolated network space for each contaner it starts. On Linux, this isolated network space is referred to as network namespace.

- a network namespace can be shared across containers or with the host operating syste,

- When a grouping of containers defined by a POD is started, a special infrastructure Pause container is initialized by the Container Runtime for the sole purpose of creating a network namespace for the Pod. All additional containers, created through user requests, running inside the POD will share the Pause container's network namespace so that they can all talk to each other via localhost.

**Pod-to-Pod comunication across nodes**

- In a Kubernetes cluster Pods, groups of containers, are scheduled on nodes in a nearly unpredictable fashion. Regardless of their host node, Pods are expected to be able to communicate with all other Pods in the cluster, all this without the implementation of Network Address Translation (NAT). This is a fundamental requirement of any networking implementation in Kubernetes.

- The Kubernetes network model aims to reduce complexity, and it treats Pods as VMs on a network, where each VM is equipped with a network interface - thus each Pod receiving a unique IP address. This model is called "IP-per-Pod" and ensures Pod-to-Pod communication, just as VMs are able to communicate with each other on the same network.

- Containers share the Pod's network namespace and must coordinate ports assignment inside the Pod just as applications would on a VM, all while being able to communicate with each other on localhost - inside the Pod.

- containers are integrated with the overall Kubernetes networking model through the use of the Container Network Interface (CNI) supported by CNI plugins. CNI is a set of specifications and libraries which allow plugins to configure the networking for containers. While there are a few core plugins, most CNI plugins are 3rd-party Software Defined Networking (SDN) solutions implementing the Kubernetes networking model. In addition to addressing the fundamental requirement of the networking model, some networking solutions offer support for Network Policies. Flannel, Weave, Calico, and Cilium are only a few of the SDN solutions available for Kubernetes clusters.

![](images/CNIcoreplugins.png)

- The container runtime offloads the IP assignment to CNI, which connects to the underlying configured plugin, such as Bridge or MACvlan, to get the IP address. Once the IP address is given by the respective plugin, CNI forwards it back to the requested container runtime.

**External-to-Pod Communication**

- A successfully deployed containerized application running in Pods inside a Kubernetes cluster may require accessibility from the outside world. Kubernetes enables external accessibility through Services, complex encapsulations of network routing rule definitions stored in iptables on cluster nodes and implemented by kube-proxy agents. By exposing services to the external world with the aid of kube-proxy, applications become accessible from outside the cluster over a virtual IP address and a dedicated port number.
