import 'package:flutter/material.dart';
import 'package:WhereIsEveryone/models/status.dart';
import 'package:provider/provider.dart';
import 'package:WhereIsEveryone/screens/home/status_tile.dart';

class StatusListWFH extends StatefulWidget {
  @override
  _StatusListStateWFH createState() => _StatusListStateWFH();
}

class _StatusListStateWFH extends State<StatusListWFH> {
  @override
  Widget build(BuildContext context) {

    final wfh = Provider.of<List<Status>>(context) ?? [];

    return ListView.builder(
      itemCount: wfh.length,
      itemBuilder: (context, index){
        return StatusTile(status: wfh[index]);
      },
    );
  }
}

class StatusListWIO extends StatefulWidget {
  @override
  _StatusListStateWIO createState() => _StatusListStateWIO();
}

class _StatusListStateWIO extends State<StatusListWIO> {
  @override
  Widget build(BuildContext context) {

    final wio = Provider.of<List<Status>>(context) ?? [];

    return ListView.builder(
      itemCount: wio.length,
      itemBuilder: (context, index){
        return StatusTile(status: wio[index]);
      },
    );
  }
}

class StatusListOPL extends StatefulWidget {
  @override
  _StatusListStateOPL createState() => _StatusListStateOPL();
}

class _StatusListStateOPL extends State<StatusListOPL> {
  @override
  Widget build(BuildContext context) {

    final opl = Provider.of<List<Status>>(context) ?? [];

    return ListView.builder(
      itemCount: opl.length,
      itemBuilder: (context, index){
        return StatusTile(status: opl[index]);
      },
    );
  }
}

class StatusListOSL extends StatefulWidget {
  @override
  _StatusListStateOSL createState() => _StatusListStateOSL();
}

class _StatusListStateOSL extends State<StatusListOSL> {
  @override
  Widget build(BuildContext context) {

    final osl = Provider.of<List<Status>>(context) ?? [];

    return ListView.builder(
      itemCount: osl.length,
      itemBuilder: (context, index){
        return StatusTile(status: osl[index]);
      },
    );
  }
}

class StatusListBT extends StatefulWidget {
  @override
  _StatusListStateBT createState() => _StatusListStateBT();
}

class _StatusListStateBT extends State<StatusListBT> {
  @override
  Widget build(BuildContext context) {

    final bt = Provider.of<List<Status>>(context) ?? [];

    return ListView.builder(
      itemCount: bt.length,
      itemBuilder: (context, index){
        return StatusTile(status: bt[index]);
      },
    );
  }
}