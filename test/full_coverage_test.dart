// ignore_for_file: unused_import
import 'package:cpedidos_pmp/main.dart';
import 'package:cpedidos_pmp/src/app_module.dart';
import 'package:cpedidos_pmp/src/auth/data/dtos/user_dto.dart';
import 'package:cpedidos_pmp/src/auth/data/repositories/remote/firebase_auth_remote_repo.dart';
import 'package:cpedidos_pmp/src/auth/data/repositories/remote/firebase_user_remote_repo.dart';
import 'package:cpedidos_pmp/src/auth/domain/entities/user.dart';
import 'package:cpedidos_pmp/src/auth/domain/errors/failures.dart';
import 'package:cpedidos_pmp/src/auth/domain/repositories/auth_repo.dart';
import 'package:cpedidos_pmp/src/auth/domain/repositories/user_repo.dart';
import 'package:cpedidos_pmp/src/auth/domain/usecases/do_login.dart';
import 'package:cpedidos_pmp/src/auth/domain/usecases/do_logout.dart';
import 'package:cpedidos_pmp/src/auth/domain/usecases/get_current_user.dart';
import 'package:cpedidos_pmp/src/auth/presentation/cubits/auth_cubit.dart';
import 'package:cpedidos_pmp/src/auth/presentation/cubits/auth_state.dart';
import 'package:cpedidos_pmp/src/auth/presentation/guards/admin_guard.dart';
import 'package:cpedidos_pmp/src/auth/presentation/guards/auth_guard.dart';
import 'package:cpedidos_pmp/src/auth/presentation/guards/guest_guard.dart';
import 'package:cpedidos_pmp/src/auth/presentation/pages/login_page.dart';
import 'package:cpedidos_pmp/src/auth/presentation/widgets/admin_button.dart';
import 'package:cpedidos_pmp/src/auth/presentation/widgets/logout_button.dart';
import 'package:cpedidos_pmp/src/orders/data/dtos/order_dto.dart';
import 'package:cpedidos_pmp/src/orders/data/repositories/remote/firebase_order_remote_repo.dart';
import 'package:cpedidos_pmp/src/orders/data/services/pdf_service.dart';
import 'package:cpedidos_pmp/src/orders/data/services/print_service.dart';
import 'package:cpedidos_pmp/src/orders/domain/dtos/order_dto.dart';
import 'package:cpedidos_pmp/src/orders/domain/entities/order.dart';
import 'package:cpedidos_pmp/src/orders/domain/errors/failures.dart';
import 'package:cpedidos_pmp/src/orders/domain/repositories/order_repo.dart';
import 'package:cpedidos_pmp/src/orders/domain/services/pdf_service.dart';
import 'package:cpedidos_pmp/src/orders/domain/services/print_service.dart';
import 'package:cpedidos_pmp/src/orders/domain/usecases/delete_order.dart';
import 'package:cpedidos_pmp/src/orders/domain/usecases/get_all_orders_by_send_date.dart';
import 'package:cpedidos_pmp/src/orders/domain/usecases/get_order_by_type_and_number.dart';
import 'package:cpedidos_pmp/src/orders/domain/usecases/print_orders_report.dart';
import 'package:cpedidos_pmp/src/orders/domain/usecases/save_order.dart';
import 'package:cpedidos_pmp/src/orders/presentation/cubits/orders_report_cubit.dart';
import 'package:cpedidos_pmp/src/orders/presentation/cubits/orders_report_state.dart';
import 'package:cpedidos_pmp/src/orders/presentation/cubits/order_register_cubit.dart';
import 'package:cpedidos_pmp/src/orders/presentation/cubits/order_register_state.dart';
import 'package:cpedidos_pmp/src/orders/presentation/pages/orders_report_page.dart';
import 'package:cpedidos_pmp/src/orders/presentation/pages/order_register_page.dart';
import 'package:cpedidos_pmp/src/shared/config/firebase/firebase_config.dart';
import 'package:cpedidos_pmp/src/shared/config/firebase/firebase_options.g.dart';
import 'package:cpedidos_pmp/src/shared/config/sentry/sentry_config.dart';
import 'package:cpedidos_pmp/src/shared/config/theme/theme_config.dart';
import 'package:cpedidos_pmp/src/shared/helpers/debounce.dart';
import 'package:cpedidos_pmp/src/shared/helpers/input_formatters.dart';
import 'package:cpedidos_pmp/src/shared/helpers/universal_imports.dart';
import 'package:cpedidos_pmp/src/shared/managers/snackbar_manager.dart';
import 'package:cpedidos_pmp/src/shared/widgets/buttons/outline_button.dart';
import 'package:cpedidos_pmp/src/shared/widgets/dialogs/confirm_dialog.dart';
import 'package:cpedidos_pmp/src/shared/widgets/inputs/password_input.dart';
import 'package:cpedidos_pmp/src/shared/widgets/inputs/select_input.dart';
import 'package:cpedidos_pmp/src/shared/widgets/inputs/text_area_input.dart';
import 'package:cpedidos_pmp/src/shared/widgets/inputs/text_input.dart';
import 'package:cpedidos_pmp/src/shared/widgets/loaders/logo_fullscreen_loader.dart';

void main() {}
