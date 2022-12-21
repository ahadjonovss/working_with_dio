import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:working_with_dio/view_model/transfer_view_model.dart';

class TransfersPage extends StatelessWidget {
  TransfersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<TransferViewModel>(
          builder: (context, value, child) {
            if (value.transferModels != null) {
              int currentInfo=context.watch<TransferViewModel>().currentInfo;
              List transfers=value.transferModels!;
              return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 200,),
                    const Center(child: Text("Information",style: TextStyle(fontWeight: FontWeight.w600),),),
                    const SizedBox(height: 20,),
                    Text('Date: ${transfers[currentInfo].data[0].date.toString()}'),
                    Text('Amount: ${transfers[currentInfo].data[0].amount.toString()}'),
                    Text('Transaction code: ${transfers[currentInfo].data[0].transactionCode.toString()}'),
                    const SizedBox(height: 20,),
                    Text('Receiver : ${transfers[currentInfo].data[0].receiver.name.toString()}'),
                    Text('Location: ${transfers[currentInfo].data[0].receiver.location.toString()}'),
                    const SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(onPressed: (){
                          context.read<TransferViewModel>().changeInfo(0);
                        }, child: const Text("1")),
                        ElevatedButton(onPressed: (){
                          context.read<TransferViewModel>().changeInfo(1);
                        }, child: const Text("2")),
                        ElevatedButton(onPressed: (){
                          context.read<TransferViewModel>().changeInfo(2);

                        }, child: const Text("3")),
                      ],
                    )
                  ],
                ),
              );
            }
            return const Text("No data");
          },
        ),
      ),
    );
  }
}
