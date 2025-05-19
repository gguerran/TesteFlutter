// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:teste_flutter/features/customers/entities/customer.entity.dart';

part 'table.store.g.dart';

class TableStore = _TableStoreBase with _$TableStore;

abstract class _TableStoreBase with Store {
  @observable
  ObservableList<CustomerEntity> customers = ObservableList<CustomerEntity>();

  @observable
  String identificator = "";

  @action
  void addAllCustomers(List<CustomerEntity> customersList) {
    customers.addAll(customersList);
  }

  @action
  void addCustomer(CustomerEntity customer) {
    customers.add(customer);
  }

  @action
  void removeCustomer(CustomerEntity customer) {
    customers.remove(customer);
  }

  @action
  void updateTable(CustomerEntity customer) {
    final index = customers.indexWhere((element) => element.id == customer.id);
    customers[index] = customer;
  }

  @action
  void setIdentificator(String identificator) {
    this.identificator = identificator;
  }
}
