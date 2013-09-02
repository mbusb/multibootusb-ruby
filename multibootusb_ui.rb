=begin
** Form generated from reading ui file 'multibootusb-new.ui'
**
** Created: Tue Jun 18 23:21:56 2013
**      by: Qt User Interface Compiler version 4.8.1
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_Dialog
    attr_reader :horizontalLayout
    attr_reader :tabWidget
    attr_reader :tab_3
    attr_reader :horizontalLayout_2
    attr_reader :gridLayout
    attr_reader :comboBox
    attr_reader :create
    attr_reader :close
    attr_reader :listWidget
    attr_reader :lineEdit
    attr_reader :browse_iso
    attr_reader :labelstep1
    attr_reader :labelstep2
    attr_reader :labelstep3
    attr_reader :progressBar
    attr_reader :groupBox
    attr_reader :verticalLayout
    attr_reader :gridLayout_5
    attr_reader :uninstall
    attr_reader :label
    attr_reader :groupBox_6
    attr_reader :verticalLayout_5
    attr_reader :usb_dev
    attr_reader :usb_label
    attr_reader :usb_mount
    attr_reader :usb_size_ttl
    attr_reader :usb_size_avl
    attr_reader :syslinux_ab
    attr_reader :horizontalLayout_3
    attr_reader :gridLayout_2
    attr_reader :groupBox_2
    attr_reader :horizontalLayout_4
    attr_reader :gridLayout_3
    attr_reader :install_syslinux
    attr_reader :horizontalSpacer_2
    attr_reader :install_sys_all
    attr_reader :install_sys_only
    attr_reader :groupBox_3
    attr_reader :horizontalLayout_5
    attr_reader :gridLayout_4
    attr_reader :edit_syslinux
    attr_reader :horizontalSpacer_3
    attr_reader :label_2
    attr_reader :tab
    attr_reader :verticalLayout_2
    attr_reader :groupBox_5
    attr_reader :verticalLayout_3
    attr_reader :gridLayout_7
    attr_reader :boot_iso_qemu
    attr_reader :ram_iso_768
    attr_reader :ram_iso_256
    attr_reader :lineEdit_2
    attr_reader :ram_iso_512
    attr_reader :label_3
    attr_reader :browse_iso_qemu
    attr_reader :ram_iso_1024
    attr_reader :ram_iso_2048
    attr_reader :label_7
    attr_reader :gridLayout_6
    attr_reader :groupBox_4
    attr_reader :verticalLayout_4
    attr_reader :gridLayout_8
    attr_reader :label_6
    attr_reader :ram_usb_2048
    attr_reader :label_4
    attr_reader :ram_usb_256
    attr_reader :ram_usb_512
    attr_reader :ram_usb_1024
    attr_reader :ram_usb_768
    attr_reader :boot_usb_qemu
    attr_reader :settings
    attr_reader :horizontalLayout_7
    attr_reader :gridLayout_9
    attr_reader :groupBox_7
    attr_reader :verticalLayout_6
    attr_reader :gridLayout_11
    attr_reader :groupBox_9
    attr_reader :verticalLayout_8
    attr_reader :checkBox
    attr_reader :label_8
    attr_reader :groupBox_10
    attr_reader :verticalLayout_9
    attr_reader :checkBox_2
    attr_reader :label_9
    attr_reader :groupBox_8
    attr_reader :verticalLayout_7
    attr_reader :gridLayout_12
    attr_reader :checkBox_3
    attr_reader :label_10
    attr_reader :tab_2
    attr_reader :horizontalLayout_6
    attr_reader :gridLayout_10
    attr_reader :verticalSpacer_5
    attr_reader :horizontalSpacer_4
    attr_reader :verticalSpacer_4
    attr_reader :label_5
    attr_reader :horizontalSpacer_5

    def setupUi(dialog)
    if dialog.objectName.nil?
        dialog.objectName = "dialog"
    end
    dialog.resize(537, 448)
    icon = Qt::Icon.new
    icon.addPixmap(Qt::Pixmap.new("multibootusb.png"), Qt::Icon::Normal, Qt::Icon::Off)
    dialog.windowIcon = icon
    @horizontalLayout = Qt::HBoxLayout.new(dialog)
    @horizontalLayout.objectName = "horizontalLayout"
    @tabWidget = Qt::TabWidget.new(dialog)
    @tabWidget.objectName = "tabWidget"
    @tab_3 = Qt::Widget.new()
    @tab_3.objectName = "tab_3"
    @horizontalLayout_2 = Qt::HBoxLayout.new(@tab_3)
    @horizontalLayout_2.objectName = "horizontalLayout_2"
    @gridLayout = Qt::GridLayout.new()
    @gridLayout.objectName = "gridLayout"
    @comboBox = Qt::ComboBox.new(@tab_3)
    @comboBox.objectName = "comboBox"

    @gridLayout.addWidget(@comboBox, 0, 2, 1, 2)

    @create = Qt::PushButton.new(@tab_3)
    @create.objectName = "create"

    @gridLayout.addWidget(@create, 4, 3, 1, 1)

    @close = Qt::PushButton.new(@tab_3)
    @close.objectName = "close"

    @gridLayout.addWidget(@close, 4, 2, 1, 1)

    @listWidget = Qt::ListWidget.new(@tab_3)
    @listWidget.objectName = "listWidget"

    @gridLayout.addWidget(@listWidget, 0, 0, 3, 1)

    @lineEdit = Qt::LineEdit.new(@tab_3)
    @lineEdit.objectName = "lineEdit"

    @gridLayout.addWidget(@lineEdit, 3, 0, 1, 3)

    @browse_iso = Qt::PushButton.new(@tab_3)
    @browse_iso.objectName = "browse_iso"

    @gridLayout.addWidget(@browse_iso, 3, 3, 1, 1)

    @labelstep1 = Qt::Label.new(@tab_3)
    @labelstep1.objectName = "labelstep1"

    @gridLayout.addWidget(@labelstep1, 0, 4, 1, 1)

    @labelstep2 = Qt::Label.new(@tab_3)
    @labelstep2.objectName = "labelstep2"

    @gridLayout.addWidget(@labelstep2, 3, 4, 1, 1)

    @labelstep3 = Qt::Label.new(@tab_3)
    @labelstep3.objectName = "labelstep3"

    @gridLayout.addWidget(@labelstep3, 4, 4, 1, 1)

    @progressBar = Qt::ProgressBar.new(@tab_3)
    @progressBar.objectName = "progressBar"
    @progressBar.value = 0

    @gridLayout.addWidget(@progressBar, 5, 0, 1, 5)

    @groupBox = Qt::GroupBox.new(@tab_3)
    @groupBox.objectName = "groupBox"
    @verticalLayout = Qt::VBoxLayout.new(@groupBox)
    @verticalLayout.objectName = "verticalLayout"
    @gridLayout_5 = Qt::GridLayout.new()
    @gridLayout_5.objectName = "gridLayout_5"
    @uninstall = Qt::PushButton.new(@groupBox)
    @uninstall.objectName = "uninstall"

    @gridLayout_5.addWidget(@uninstall, 0, 0, 1, 1)


    @verticalLayout.addLayout(@gridLayout_5)


    @gridLayout.addWidget(@groupBox, 2, 2, 1, 2)

    @label = Qt::Label.new(@tab_3)
    @label.objectName = "label"

    @gridLayout.addWidget(@label, 4, 0, 1, 2)

    @groupBox_6 = Qt::GroupBox.new(@tab_3)
    @groupBox_6.objectName = "groupBox_6"
    @verticalLayout_5 = Qt::VBoxLayout.new(@groupBox_6)
    @verticalLayout_5.objectName = "verticalLayout_5"
    @usb_dev = Qt::Label.new(@groupBox_6)
    @usb_dev.objectName = "usb_dev"

    @verticalLayout_5.addWidget(@usb_dev)

    @usb_label = Qt::Label.new(@groupBox_6)
    @usb_label.objectName = "usb_label"

    @verticalLayout_5.addWidget(@usb_label)

    @usb_mount = Qt::Label.new(@groupBox_6)
    @usb_mount.objectName = "usb_mount"

    @verticalLayout_5.addWidget(@usb_mount)

    @usb_size_ttl = Qt::Label.new(@groupBox_6)
    @usb_size_ttl.objectName = "usb_size_ttl"

    @verticalLayout_5.addWidget(@usb_size_ttl)

    @usb_size_avl = Qt::Label.new(@groupBox_6)
    @usb_size_avl.objectName = "usb_size_avl"

    @verticalLayout_5.addWidget(@usb_size_avl)


    @gridLayout.addWidget(@groupBox_6, 1, 2, 1, 2)


    @horizontalLayout_2.addLayout(@gridLayout)

    @tabWidget.addTab(@tab_3, Qt::Application.translate("Dialog", "Multibootusb", nil, Qt::Application::UnicodeUTF8))
    @syslinux_ab = Qt::Widget.new()
    @syslinux_ab.objectName = "syslinux_ab"
    @horizontalLayout_3 = Qt::HBoxLayout.new(@syslinux_ab)
    @horizontalLayout_3.objectName = "horizontalLayout_3"
    @gridLayout_2 = Qt::GridLayout.new()
    @gridLayout_2.objectName = "gridLayout_2"
    @groupBox_2 = Qt::GroupBox.new(@syslinux_ab)
    @groupBox_2.objectName = "groupBox_2"
    @horizontalLayout_4 = Qt::HBoxLayout.new(@groupBox_2)
    @horizontalLayout_4.objectName = "horizontalLayout_4"
    @gridLayout_3 = Qt::GridLayout.new()
    @gridLayout_3.objectName = "gridLayout_3"
    @install_syslinux = Qt::PushButton.new(@groupBox_2)
    @install_syslinux.objectName = "install_syslinux"

    @gridLayout_3.addWidget(@install_syslinux, 2, 1, 1, 1)

    @horizontalSpacer_2 = Qt::SpacerItem.new(40, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @gridLayout_3.addItem(@horizontalSpacer_2, 2, 0, 1, 1)

    @install_sys_all = Qt::RadioButton.new(@groupBox_2)
    @install_sys_all.objectName = "install_sys_all"

    @gridLayout_3.addWidget(@install_sys_all, 1, 0, 1, 2)

    @install_sys_only = Qt::RadioButton.new(@groupBox_2)
    @install_sys_only.objectName = "install_sys_only"

    @gridLayout_3.addWidget(@install_sys_only, 0, 0, 1, 2)


    @horizontalLayout_4.addLayout(@gridLayout_3)


    @gridLayout_2.addWidget(@groupBox_2, 0, 0, 1, 1)

    @groupBox_3 = Qt::GroupBox.new(@syslinux_ab)
    @groupBox_3.objectName = "groupBox_3"
    @horizontalLayout_5 = Qt::HBoxLayout.new(@groupBox_3)
    @horizontalLayout_5.objectName = "horizontalLayout_5"
    @gridLayout_4 = Qt::GridLayout.new()
    @gridLayout_4.objectName = "gridLayout_4"
    @edit_syslinux = Qt::PushButton.new(@groupBox_3)
    @edit_syslinux.objectName = "edit_syslinux"

    @gridLayout_4.addWidget(@edit_syslinux, 1, 1, 1, 1)

    @horizontalSpacer_3 = Qt::SpacerItem.new(40, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @gridLayout_4.addItem(@horizontalSpacer_3, 1, 0, 1, 1)

    @label_2 = Qt::Label.new(@groupBox_3)
    @label_2.objectName = "label_2"

    @gridLayout_4.addWidget(@label_2, 0, 0, 1, 2)


    @horizontalLayout_5.addLayout(@gridLayout_4)


    @gridLayout_2.addWidget(@groupBox_3, 1, 0, 1, 1)


    @horizontalLayout_3.addLayout(@gridLayout_2)

    @tabWidget.addTab(@syslinux_ab, Qt::Application.translate("Dialog", "Syslinux", nil, Qt::Application::UnicodeUTF8))
    @tab = Qt::Widget.new()
    @tab.objectName = "tab"
    @verticalLayout_2 = Qt::VBoxLayout.new(@tab)
    @verticalLayout_2.objectName = "verticalLayout_2"
    @groupBox_5 = Qt::GroupBox.new(@tab)
    @groupBox_5.objectName = "groupBox_5"
    @verticalLayout_3 = Qt::VBoxLayout.new(@groupBox_5)
    @verticalLayout_3.objectName = "verticalLayout_3"
    @gridLayout_7 = Qt::GridLayout.new()
    @gridLayout_7.objectName = "gridLayout_7"
    @boot_iso_qemu = Qt::PushButton.new(@groupBox_5)
    @boot_iso_qemu.objectName = "boot_iso_qemu"

    @gridLayout_7.addWidget(@boot_iso_qemu, 3, 4, 1, 1)

    @ram_iso_768 = Qt::RadioButton.new(@groupBox_5)
    @ram_iso_768.objectName = "ram_iso_768"

    @gridLayout_7.addWidget(@ram_iso_768, 2, 2, 1, 1)

    @ram_iso_256 = Qt::RadioButton.new(@groupBox_5)
    @ram_iso_256.objectName = "ram_iso_256"

    @gridLayout_7.addWidget(@ram_iso_256, 2, 0, 1, 1)

    @lineEdit_2 = Qt::LineEdit.new(@groupBox_5)
    @lineEdit_2.objectName = "lineEdit_2"

    @gridLayout_7.addWidget(@lineEdit_2, 1, 0, 1, 4)

    @ram_iso_512 = Qt::RadioButton.new(@groupBox_5)
    @ram_iso_512.objectName = "ram_iso_512"

    @gridLayout_7.addWidget(@ram_iso_512, 2, 1, 1, 1)

    @label_3 = Qt::Label.new(@groupBox_5)
    @label_3.objectName = "label_3"

    @gridLayout_7.addWidget(@label_3, 3, 0, 1, 4)

    @browse_iso_qemu = Qt::PushButton.new(@groupBox_5)
    @browse_iso_qemu.objectName = "browse_iso_qemu"

    @gridLayout_7.addWidget(@browse_iso_qemu, 1, 4, 1, 1)

    @ram_iso_1024 = Qt::RadioButton.new(@groupBox_5)
    @ram_iso_1024.objectName = "ram_iso_1024"

    @gridLayout_7.addWidget(@ram_iso_1024, 2, 3, 1, 1)

    @ram_iso_2048 = Qt::RadioButton.new(@groupBox_5)
    @ram_iso_2048.objectName = "ram_iso_2048"

    @gridLayout_7.addWidget(@ram_iso_2048, 2, 4, 1, 1)

    @label_7 = Qt::Label.new(@groupBox_5)
    @label_7.objectName = "label_7"

    @gridLayout_7.addWidget(@label_7, 0, 0, 1, 5)


    @verticalLayout_3.addLayout(@gridLayout_7)


    @verticalLayout_2.addWidget(@groupBox_5)

    @gridLayout_6 = Qt::GridLayout.new()
    @gridLayout_6.objectName = "gridLayout_6"
    @groupBox_4 = Qt::GroupBox.new(@tab)
    @groupBox_4.objectName = "groupBox_4"
    @verticalLayout_4 = Qt::VBoxLayout.new(@groupBox_4)
    @verticalLayout_4.objectName = "verticalLayout_4"
    @gridLayout_8 = Qt::GridLayout.new()
    @gridLayout_8.objectName = "gridLayout_8"
    @label_6 = Qt::Label.new(@groupBox_4)
    @label_6.objectName = "label_6"

    @gridLayout_8.addWidget(@label_6, 0, 0, 1, 5)

    @ram_usb_2048 = Qt::RadioButton.new(@groupBox_4)
    @ram_usb_2048.objectName = "ram_usb_2048"

    @gridLayout_8.addWidget(@ram_usb_2048, 1, 4, 1, 1)

    @label_4 = Qt::Label.new(@groupBox_4)
    @label_4.objectName = "label_4"

    @gridLayout_8.addWidget(@label_4, 2, 0, 1, 4)

    @ram_usb_256 = Qt::RadioButton.new(@groupBox_4)
    @ram_usb_256.objectName = "ram_usb_256"

    @gridLayout_8.addWidget(@ram_usb_256, 1, 0, 1, 1)

    @ram_usb_512 = Qt::RadioButton.new(@groupBox_4)
    @ram_usb_512.objectName = "ram_usb_512"

    @gridLayout_8.addWidget(@ram_usb_512, 1, 1, 1, 1)

    @ram_usb_1024 = Qt::RadioButton.new(@groupBox_4)
    @ram_usb_1024.objectName = "ram_usb_1024"

    @gridLayout_8.addWidget(@ram_usb_1024, 1, 3, 1, 1)

    @ram_usb_768 = Qt::RadioButton.new(@groupBox_4)
    @ram_usb_768.objectName = "ram_usb_768"

    @gridLayout_8.addWidget(@ram_usb_768, 1, 2, 1, 1)

    @boot_usb_qemu = Qt::PushButton.new(@groupBox_4)
    @boot_usb_qemu.objectName = "boot_usb_qemu"

    @gridLayout_8.addWidget(@boot_usb_qemu, 2, 4, 1, 1)


    @verticalLayout_4.addLayout(@gridLayout_8)


    @gridLayout_6.addWidget(@groupBox_4, 0, 0, 1, 1)


    @verticalLayout_2.addLayout(@gridLayout_6)

    @tabWidget.addTab(@tab, Qt::Application.translate("Dialog", "QEMU", nil, Qt::Application::UnicodeUTF8))
    @settings = Qt::Widget.new()
    @settings.objectName = "settings"
    @horizontalLayout_7 = Qt::HBoxLayout.new(@settings)
    @horizontalLayout_7.objectName = "horizontalLayout_7"
    @gridLayout_9 = Qt::GridLayout.new()
    @gridLayout_9.objectName = "gridLayout_9"
    @groupBox_7 = Qt::GroupBox.new(@settings)
    @groupBox_7.objectName = "groupBox_7"
    @verticalLayout_6 = Qt::VBoxLayout.new(@groupBox_7)
    @verticalLayout_6.objectName = "verticalLayout_6"
    @gridLayout_11 = Qt::GridLayout.new()
    @gridLayout_11.objectName = "gridLayout_11"
    @groupBox_9 = Qt::GroupBox.new(@groupBox_7)
    @groupBox_9.objectName = "groupBox_9"
    @verticalLayout_8 = Qt::VBoxLayout.new(@groupBox_9)
    @verticalLayout_8.objectName = "verticalLayout_8"
    @checkBox = Qt::CheckBox.new(@groupBox_9)
    @checkBox.objectName = "checkBox"

    @verticalLayout_8.addWidget(@checkBox)

    @label_8 = Qt::Label.new(@groupBox_9)
    @label_8.objectName = "label_8"

    @verticalLayout_8.addWidget(@label_8)


    @gridLayout_11.addWidget(@groupBox_9, 0, 0, 1, 1)

    @groupBox_10 = Qt::GroupBox.new(@groupBox_7)
    @groupBox_10.objectName = "groupBox_10"
    @verticalLayout_9 = Qt::VBoxLayout.new(@groupBox_10)
    @verticalLayout_9.objectName = "verticalLayout_9"
    @checkBox_2 = Qt::CheckBox.new(@groupBox_10)
    @checkBox_2.objectName = "checkBox_2"

    @verticalLayout_9.addWidget(@checkBox_2)

    @label_9 = Qt::Label.new(@groupBox_10)
    @label_9.objectName = "label_9"

    @verticalLayout_9.addWidget(@label_9)


    @gridLayout_11.addWidget(@groupBox_10, 0, 1, 1, 1)


    @verticalLayout_6.addLayout(@gridLayout_11)


    @gridLayout_9.addWidget(@groupBox_7, 1, 0, 1, 1)

    @groupBox_8 = Qt::GroupBox.new(@settings)
    @groupBox_8.objectName = "groupBox_8"
    @verticalLayout_7 = Qt::VBoxLayout.new(@groupBox_8)
    @verticalLayout_7.objectName = "verticalLayout_7"
    @gridLayout_12 = Qt::GridLayout.new()
    @gridLayout_12.objectName = "gridLayout_12"
    @checkBox_3 = Qt::CheckBox.new(@groupBox_8)
    @checkBox_3.objectName = "checkBox_3"

    @gridLayout_12.addWidget(@checkBox_3, 0, 0, 1, 1)

    @label_10 = Qt::Label.new(@groupBox_8)
    @label_10.objectName = "label_10"

    @gridLayout_12.addWidget(@label_10, 1, 0, 1, 1)


    @verticalLayout_7.addLayout(@gridLayout_12)


    @gridLayout_9.addWidget(@groupBox_8, 2, 0, 1, 1)


    @horizontalLayout_7.addLayout(@gridLayout_9)

    @tabWidget.addTab(@settings, Qt::Application.translate("Dialog", "Settings", nil, Qt::Application::UnicodeUTF8))
    @tab_2 = Qt::Widget.new()
    @tab_2.objectName = "tab_2"
    @horizontalLayout_6 = Qt::HBoxLayout.new(@tab_2)
    @horizontalLayout_6.objectName = "horizontalLayout_6"
    @gridLayout_10 = Qt::GridLayout.new()
    @gridLayout_10.objectName = "gridLayout_10"
    @verticalSpacer_5 = Qt::SpacerItem.new(20, 40, Qt::SizePolicy::Minimum, Qt::SizePolicy::Minimum)

    @gridLayout_10.addItem(@verticalSpacer_5, 0, 1, 1, 1)

    @horizontalSpacer_4 = Qt::SpacerItem.new(40, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @gridLayout_10.addItem(@horizontalSpacer_4, 1, 0, 1, 1)

    @verticalSpacer_4 = Qt::SpacerItem.new(20, 30, Qt::SizePolicy::Minimum, Qt::SizePolicy::Minimum)

    @gridLayout_10.addItem(@verticalSpacer_4, 2, 1, 1, 1)

    @label_5 = Qt::Label.new(@tab_2)
    @label_5.objectName = "label_5"

    @gridLayout_10.addWidget(@label_5, 1, 1, 1, 1)

    @horizontalSpacer_5 = Qt::SpacerItem.new(40, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @gridLayout_10.addItem(@horizontalSpacer_5, 1, 2, 1, 1)


    @horizontalLayout_6.addLayout(@gridLayout_10)

    @tabWidget.addTab(@tab_2, Qt::Application.translate("Dialog", "About", nil, Qt::Application::UnicodeUTF8))

    @horizontalLayout.addWidget(@tabWidget)


    retranslateUi(dialog)

    @tabWidget.setCurrentIndex(0)


    Qt::MetaObject.connectSlotsByName(dialog)
    end # setupUi

    def setup_ui(dialog)
        setupUi(dialog)
    end

    def retranslateUi(dialog)
    dialog.windowTitle = Qt::Application.translate("Dialog", "multibootusb", nil, Qt::Application::UnicodeUTF8)
    @create.text = Qt::Application.translate("Dialog", "Create", nil, Qt::Application::UnicodeUTF8)
    @close.text = Qt::Application.translate("Dialog", "Close", nil, Qt::Application::UnicodeUTF8)
    @browse_iso.text = Qt::Application.translate("Dialog", "Browse ISO", nil, Qt::Application::UnicodeUTF8)
    @labelstep1.text = Qt::Application.translate("Dialog", "<html><head/><body><p align=\"center\"><span style=\" font-weight:600;\">Step 1</span></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @labelstep2.text = Qt::Application.translate("Dialog", "<html><head/><body><p align=\"center\"><span style=\" font-weight:600;\">Step 2</span></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @labelstep3.text = Qt::Application.translate("Dialog", "<html><head/><body><p align=\"center\"><span style=\" font-weight:600;\">Step 3</span></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @groupBox.title = Qt::Application.translate("Dialog", "Uninstall (Optional)", nil, Qt::Application::UnicodeUTF8)
    @uninstall.text = Qt::Application.translate("Dialog", "Uninstall Distro", nil, Qt::Application::UnicodeUTF8)
    @label.text = Qt::Application.translate("Dialog", "TextLabel", nil, Qt::Application::UnicodeUTF8)
    @groupBox_6.title = Qt::Application.translate("Dialog", "USB Details", nil, Qt::Application::UnicodeUTF8)
    @usb_dev.text = Qt::Application.translate("Dialog", "Drive ::", nil, Qt::Application::UnicodeUTF8)
    @usb_label.text = Qt::Application.translate("Dialog", "Label ::", nil, Qt::Application::UnicodeUTF8)
    @usb_mount.text = Qt::Application.translate("Dialog", "Mount::", nil, Qt::Application::UnicodeUTF8)
    @usb_size_ttl.text = Qt::Application.translate("Dialog", "Size Total ::", nil, Qt::Application::UnicodeUTF8)
    @usb_size_avl.text = Qt::Application.translate("Dialog", "Size Avail ::", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@tab_3), Qt::Application.translate("Dialog", "Multibootusb", nil, Qt::Application::UnicodeUTF8))
    @groupBox_2.title = Qt::Application.translate("Dialog", "Install Syslinux", nil, Qt::Application::UnicodeUTF8)
    @install_syslinux.text = Qt::Application.translate("Dialog", "Install", nil, Qt::Application::UnicodeUTF8)
    @install_sys_all.text = Qt::Application.translate("Dialog", "Install syslinux and copy all required files.", nil, Qt::Application::UnicodeUTF8)
    @install_sys_only.text = Qt::Application.translate("Dialog", "Install only syslinux (existing configurations will not be altred).", nil, Qt::Application::UnicodeUTF8)
    @groupBox_3.title = Qt::Application.translate("Dialog", "Edit syslinux.cfg", nil, Qt::Application::UnicodeUTF8)
    @edit_syslinux.text = Qt::Application.translate("Dialog", "Edit", nil, Qt::Application::UnicodeUTF8)
    @label_2.text = Qt::Application.translate("Dialog", "<html><head/><body><p align=\"justify\">Using this option user can edit syslinux.cfg file directly. It directly uses </p><p align=\"justify\">default editor of host system. Be careful while editing syslinux.cfg file.</p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@syslinux_ab), Qt::Application.translate("Dialog", "Syslinux", nil, Qt::Application::UnicodeUTF8))
    @groupBox_5.title = Qt::Application.translate("Dialog", "Boot ISO", nil, Qt::Application::UnicodeUTF8)
    @boot_iso_qemu.text = Qt::Application.translate("Dialog", "Boot ISO", nil, Qt::Application::UnicodeUTF8)
    @ram_iso_768.text = Qt::Application.translate("Dialog", "768 MB", nil, Qt::Application::UnicodeUTF8)
    @ram_iso_256.text = Qt::Application.translate("Dialog", "256 MB", nil, Qt::Application::UnicodeUTF8)
    @ram_iso_512.text = Qt::Application.translate("Dialog", "512 MB", nil, Qt::Application::UnicodeUTF8)
    @label_3.text = Qt::Application.translate("Dialog", "Choose desired RAM and click on Boot ISO button.", nil, Qt::Application::UnicodeUTF8)
    @browse_iso_qemu.text = Qt::Application.translate("Dialog", "Browse ISO", nil, Qt::Application::UnicodeUTF8)
    @ram_iso_1024.text = Qt::Application.translate("Dialog", "1024 MB", nil, Qt::Application::UnicodeUTF8)
    @ram_iso_2048.text = Qt::Application.translate("Dialog", "2048 MB", nil, Qt::Application::UnicodeUTF8)
    @label_7.text = Qt::Application.translate("Dialog", "Best way to check downloaded iso. ", nil, Qt::Application::UnicodeUTF8)
    @groupBox_4.title = Qt::Application.translate("Dialog", "Boot USB", nil, Qt::Application::UnicodeUTF8)
    @label_6.text = Qt::Application.translate("Dialog", "<html><head/><body><p align=\"justify\">Be careful. If not used with care you may end up loosing your usb.</p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @ram_usb_2048.text = Qt::Application.translate("Dialog", "2048 MB", nil, Qt::Application::UnicodeUTF8)
    @label_4.text = Qt::Application.translate("Dialog", "Choose desired RAM and click on Boot USB button.", nil, Qt::Application::UnicodeUTF8)
    @ram_usb_256.text = Qt::Application.translate("Dialog", "256 MB", nil, Qt::Application::UnicodeUTF8)
    @ram_usb_512.text = Qt::Application.translate("Dialog", "512 MB", nil, Qt::Application::UnicodeUTF8)
    @ram_usb_1024.text = Qt::Application.translate("Dialog", "1024 MB", nil, Qt::Application::UnicodeUTF8)
    @ram_usb_768.text = Qt::Application.translate("Dialog", "768 MB", nil, Qt::Application::UnicodeUTF8)
    @boot_usb_qemu.text = Qt::Application.translate("Dialog", "Boot USB", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@tab), Qt::Application.translate("Dialog", "QEMU", nil, Qt::Application::UnicodeUTF8))
    @groupBox_7.title = Qt::Application.translate("Dialog", "Persistance", nil, Qt::Application::UnicodeUTF8)
    @groupBox_9.title = Qt::Application.translate("Dialog", "Ubuntu", nil, Qt::Application::UnicodeUTF8)
    @checkBox.text = Qt::Application.translate("Dialog", "Enable persistance", nil, Qt::Application::UnicodeUTF8)
    @label_8.text = Qt::Application.translate("Dialog", "<html><head/><body><p>Enable if you would like </p><p>to have persistancefor </p><p>ubuntu and its derivatives.</p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @groupBox_10.title = Qt::Application.translate("Dialog", "Debian", nil, Qt::Application::UnicodeUTF8)
    @checkBox_2.text = Qt::Application.translate("Dialog", "Enable persistance", nil, Qt::Application::UnicodeUTF8)
    @label_9.text = Qt::Application.translate("Dialog", "<html><head/><body><p>Enable if you would like </p><p>to have persistancefor </p><p>debian and its derivatives.</p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @groupBox_8.title = Qt::Application.translate("Dialog", "Update", nil, Qt::Application::UnicodeUTF8)
    @checkBox_3.text = Qt::Application.translate("Dialog", "Check update", nil, Qt::Application::UnicodeUTF8)
    @label_10.text = Qt::Application.translate("Dialog", "<html><head/><body><p>Enable this option if you would like to recieve update information </p><p>right in to your desktop.</p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@settings), Qt::Application.translate("Dialog", "Settings", nil, Qt::Application::UnicodeUTF8))
    @label_5.text = Qt::Application.translate("Dialog", "<html><head/><body><p align=\"center\">An advanced bootable usb creator with option to install/uninstall </p><p align=\"center\">multiple distros. This software is written in ruby and qtbindings. </p><p align=\"center\">Copyright 2010-2013 Sundar</p><p align=\"center\"><span style=\" font-weight:600; text-decoration: underline;\">Author(s)</span>: Sundar, Ian Bruce</p><p align=\"center\"><span style=\" font-weight:600; text-decoration: underline;\">Licence:</span> GPL version 2 or later</p><p align=\"center\"><span style=\" font-weight:600; text-decoration: underline;\">Help/Email:</span> feedback.multibootusb@gmail.com</p><p align=\"center\"><span style=\" font-weight:600; text-decoration: underline;\">Home page: </span>http://sourceforge.net/projects/multibootusb/</p><p align=\"center\"><br/></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@tab_2), Qt::Application.translate("Dialog", "About", nil, Qt::Application::UnicodeUTF8))
    end # retranslateUi

    def retranslate_ui(dialog)
        retranslateUi(dialog)
    end

end

module Ui
    class Dialog < Ui_Dialog
    end
end  # module Ui

