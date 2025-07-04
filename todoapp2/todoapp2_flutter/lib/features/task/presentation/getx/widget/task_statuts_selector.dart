import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todoapp2_flutter/core/enum/task_status.dart';

class StatusSelector extends StatelessWidget {
  final Rx<TaskStatus> selectedStatus;
  final Function(TaskStatus) onStatusChanged;

  const StatusSelector({
    Key? key,
    required this.selectedStatus,
    required this.onStatusChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
          color: Color(0XFFE4E5E6),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => onStatusChanged(TaskStatus.pending),
                child: Obx(
                  () => Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectedStatus.value == TaskStatus.pending
                          ? Colors.blue
                          : Color(0XFFE4E5E6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Pending',
                      style: TextStyle(
                        color: selectedStatus.value == TaskStatus.pending
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 5),
        
            Expanded(
              child: GestureDetector(
                onTap: () => onStatusChanged(TaskStatus.completed),
                child: Obx(
                  () => Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectedStatus.value == TaskStatus.completed
                          ? Colors.blue
                          : Color(0XFFE4E5E6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Completed',
                      style: TextStyle(
                        color: selectedStatus.value == TaskStatus.completed
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}