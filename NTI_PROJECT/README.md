SPI-Protocol-with-APB-interface-
Verilog RTL design of an APB-controlled 32-bit SPI master with 4 SPI slaves, supporting all 4 SPI modes, programmable clock division, and full-duplex communication.

# APB to SPI Master with 4 SPI Slaves
A Verilog RTL project that implements a 32-bit SPI master controlled through an APB interface.

The system allows an APB master to configure and control SPI communication with one of four SPI slaves.

The design supports all four SPI modes, programmable SPI clock division, active-low chip-select control, full-duplex data transfer, and APB-based configuration and status monitoring.

## Architecture


&#x20;                        APB Master

&#x20;                            |

&#x20;                            | APB

&#x20;                            v

&#x20;                 +----------------------+

&#x20;                 |  APB SPI Interface   |

&#x20;                 +----------------------+

&#x20;                   |    |    |    |    |

&#x20;                   |    |    |    |    +---- DVSR

&#x20;                   |    |    |    +--------- SLAVE\_SEL

&#x20;                   |    |    +-------------- CPOL / CPHA

&#x20;                   |    +------------------- START

&#x20;                   +------------------------ TX / RX DATA

&#x20;                            |

&#x20;                            v

&#x20;                 +----------------------+

&#x20;                 |      SPI Master      |

&#x20;                 +----------------------+

&#x20;                   |      |       |

&#x20;                  MOSI   SCLK    CS\[3:0]

&#x20;                   |      |       |

&#x20;       +-----------+------+-------+-----------+

&#x20;       |           |              |           |

&#x20;       v           v              v           v

&#x20;  +---------+ +---------+    +---------+ +---------+

&#x20;  | Slave 0 | | Slave 1 |    | Slave 2 | | Slave 3 |

&#x20;  +---------+ +---------+    +---------+ +---------+

&#x20;       |           |              |           |

&#x20;      MISO0       MISO1          MISO2       MISO3

&#x20;       |           |              |           |

&#x20;       +-----------+--------------+-----------+

&#x20;                           |

&#x20;                           v

&#x20;                  +------------------+

&#x20;                  | MISO Multiplexer |

&#x20;                  +------------------+

&#x20;                           |

&#x20;                           v

&#x20;                      Master MISO







\---------------------------------------------------------------------------------------------------------------------------







### **Project Overview**



The project combines two communication interfaces.



APB provides the control and register interface.



SPI provides communication between the master and four slave devices.



The APB interface controls



Transmit data

SPI start

CPOL

CPHA

Slave selection

SPI clock divider



#### The APB interface also provides



Received data

Busy status

Done status



The SPI master handles the actual SPI transaction.



Four identical SPI slave modules are instantiated in the top module.



### **Features**



Verilog RTL implementation

APB-controlled SPI master

Four SPI slaves

32-bit SPI data transfer

Full-duplex SPI communication

Support for SPI modes 0, 1, 2, and 3

Configurable CPOL

Configurable CPHA

Programmable SPI clock divider

Four active-low chip-select signals

Busy and done status signals

MISO multiplexing

FSM-based SPI master

Separate testbenches for the APB interface, SPI master, and SPI slave







### **APB Register Map**





Address	 Register	Access	        Description



0x0	 TX\_DATA	Write	        SPI transmit data

0x4	 RX\_DATA	Read	        SPI received data

0x8	 CTRL	        Read/Write      SPI configuration

0xC	 STATUS	        Read	        SPI status



##### CTRL Register



Bits	Signal	    Description

\[0]	START	    Start SPI transaction

\[1]	CPOL	    Clock polarity

\[2]	CPHA	    Clock phase

\[4:3]	SLAVE\_SEL   Slave selection

\[8:5]	DVSR	    Clock divider



STATUS Register



Bit	Signal	Description

\[0]	BUSY	Transaction in progress

\[1]	DONE	Transaction completed



##### SPI Modes



Mode	CPOL	CPHA



Mode 0 	0	0

Mode 1	0	1

Mode 2	1	0

Mode 3	1	1



### **Project Structure**



SPI-APB-Project/

│

├── rtl/

│   ├── apb\_spi\_interface.v

│   ├── master.v

│   ├── slave.v

│   └── spi\_top.v

│

├── tb/

│   ├── apb\_spi\_interface\_tb.v

│   ├── master\_tb.v

│   └── slave\_tb.v

│

├── docs/

│   └── spi\_architecture.png

│

├── SPI\_APB\_Project\_Report.pdf

├── SPI.pptx

└── README.md





### **Verification**



Separate testbenches are provided for



APB SPI interface

SPI master

SPI slave



The SPI master testbench verifies all four SPI modes using a loopback connection.



The slave testbench verifies 32-bit data reception and done generation.



Simulation



The design can be simulated using ModelSim, QuestaSim, Vivado Simulator, or Icarus Verilog.





### **The repository includes**



Project report

Project presentation

RTL source files

Verification testbenches

Technologies

Verilog HDL

APB

SPI

RTL Design

FSM

Digital Logic

Hardware Verification

Author



###### **Tarek Ahmed Ghoneim**



Electrical Engineering

Communications and Electronics
