package wpan_testing.simulations;

@license(LGPL);

import inet.examples.mobility.MobileHost;
import inet.networklayer.configurator.ipv4.Ipv4FlatNetworkConfigurator;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth10M;
import inet.node.inet.Router;
import inet.node.inet.SensorNode;
import inet.node.inet.StandardHost;
import inet.node.inet.WirelessHost;
import inet.node.wireless.AccessPoint;
import inet.node.xmipv6.MobileHost6;
import inet.node.xmipv6.WirelessHost6;
import inet.physicallayer.apskradio.packetlevel.ApskScalarRadioMedium;
import inet.visualizer.common.InfoCanvasVisualizer;
import inet.visualizer.physicallayer.MediumVisualizer;
import inet.visualizer.integrated.IntegratedVisualizer;

network MiniSmartHome
{
    @display("bgb=656,400;bgi=showcases/warehouse,s");
    submodules:

        visualizer: IntegratedVisualizer {
            @display("p=377,16");
        }
        radioMedium: ApskScalarRadioMedium {
            @display("p=281,19");
        }
        sensor1: SensorNode {
            @display("p=169,87");
        }
        sensor2: SensorNode {
            @display("p=169,292");
        }
        gateway: SensorNode {
            @display("p=413,306;i=misc/sensorgateway");
        }
        server: StandardHost {
            @display("p=521,306");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=498,20");
        }
    connections:
        gateway.ethg++ <--> Eth10M <--> server.ethg++;
}
