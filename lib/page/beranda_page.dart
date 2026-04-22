import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:praktek/data.dart';
import 'package:simple_alert_dialog/simple_alert_dialog.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {

  TextEditingController summaryController = TextEditingController();
  TextEditingController experienceController = TextEditingController();

  /// FORM 
  void showFormDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SingleChildScrollView(
            child: Card(
              color: Colors.blue.shade50, 
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    const Text(
                      "Form Input",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// SUMMARY
                    TextField(
                      controller: summaryController,
                      decoration: const InputDecoration(
                        labelText: "Summary",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// EXPERIENCE
                    TextField(
                      controller: experienceController,
                      decoration: const InputDecoration(
                        labelText: "Experience",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {

                          summaryData = summaryController.text;
                          experienceData = experienceController.text;

                          Navigator.pop(context);

                          CherryToast.success(
                            title: const Text("Data berhasil disimpan!"),
                          ).show(context);
                        },
                        child: const Text("Submit"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// FLOW SUBMIT
  void handleSubmit() {
    SimpleAlertDialog.show(
      context,
      assetImagepath: AnimatedImage.confirm,
      buttonsColor: Colors.green,
      title: AlertTitleText("Apakah kamu yakin?"),
      content: AlertContentText("Tambah data?"),
      onConfirmButtonPressed: (ctx) {

        Navigator.pop(context);

        CherryToast.success(
          title: const Text("Silakan isi data"),
        ).show(context);

        showFormDialog();
      },
    );
  }

  /// SHOW DIALOG
  void showSimpleDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("AlertDialog"),
        content: const Text("Ini AlertDialog"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Tutup"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          /// SUBMIT
          InkWell(
            onTap: handleSubmit,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text("Submit", style: TextStyle(color: Colors.white)),
            ),
          ),

          const SizedBox(height: 10),

          /// DELETE
          InkWell(
            onTap: () {
              summaryData = "";
              experienceData = "";

              CherryToast.success(
                title: const Text("Data dihapus"),
              ).show(context);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text("Delete", style: TextStyle(color: Colors.white)),
            ),
          ),

          const SizedBox(height: 10),

          /// SHOW DIALOG
          InkWell(
            onTap: showSimpleDialog,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text("Show Dialog", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}