import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_app/ui/screens/student/screens/family/screens/family_layout.dart';
import 'package:panakj_app/ui/screens/student/screens/family/widgets/card/family_card.dart';
import 'package:panakj_app/ui/screens/student/screens/family/widgets/card/siblings_card.dart';
import 'package:panakj_app/ui/screens/student/screens/family/widgets/local_widgets/do_you_have_siblings.dart';
import 'package:panakj_app/ui/view_model/family/family_bloc.dart';

class FamilyScreen extends StatelessWidget {
    TextEditingController fatherincomeController = TextEditingController();
  TextEditingController motherincomeController = TextEditingController();
  TextEditingController guardiaincomeController = TextEditingController();
   FamilyScreen({super.key,required this.fatherincomeController,required this.motherincomeController,required this.guardiaincomeController,});

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<FamilyBloc, FamilyState>(
      builder: (context, state) {
        return Column(
          children: [
            FamilyLayout(
              familyLayoutheight: 1579,
              title: 'Family Details',
              familyDetailsCard: FamilyCard(
                mybool: false,
                siblings: DoYouHaveSiblings(),
                fatherincomeController: fatherincomeController,
                motherincomeController: motherincomeController,
                guardiaincomeController: guardiaincomeController,
              ),
            ),
            state.siblings
                ? Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: FamilyLayout(
                      familyLayoutheight: 583 +
                          (state.numberOfSiblings > 0
                              ? (state.numberOfSiblings) * 505
                              : 0),
                      title: 'Siblings Details',
                      familyDetailsCard: SiblingsCard(
                        mybool: false,
                      ),
                    ),
                  )
                : const Text(''),
          ],
        );
      },
    );
  }
}
