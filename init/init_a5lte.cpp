/*
   Copyright (c) 2020, The Linux Foundation. All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

#include <android-base/file.h>
#include <android-base/logging.h>
#include <android-base/properties.h>
#include <android-base/strings.h>

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "property_service.h"
#include "vendor_init.h"

using android::base::GetProperty;
using android::base::ReadFileToString;
using android::base::Trim;
using android::init::property_set;

// copied from build/tools/releasetools/ota_from_target_files.py
// but with "." at the end and empty entry
std::vector<std::string> ro_product_props_default_source_order = {
    "",
    "product.",
    "product_services.",
    "odm.",
    "vendor.",
    "system.",
};

void property_override(char const prop[], char const value[], bool add = true)
{
    auto pi = (prop_info *) __system_property_find(prop);

    if (pi != nullptr) {
        __system_property_update(pi, value, strlen(value));
    } else if (add) {
        __system_property_add(prop, strlen(prop), value, strlen(value));
    }
}

void set_rild_libpath(char const *variant)
{
    std::string libpath("/system/vendor/lib/libsec-ril.");
    libpath += variant;
    libpath += ".so";

    property_override("rild.libpath", libpath.c_str());
}

void cdma_properties(char const *operator_alpha,
        char const *operator_numeric,
        char const *default_network,
        char const *rild_lib_variant)
{
    /* Dynamic CDMA Properties */
    property_set("ro.cdma.home.operator.alpha", operator_alpha);
    property_set("ro.cdma.home.operator.numeric", operator_numeric);
    property_set("ro.telephony.default_network", default_network);
    set_rild_libpath(rild_lib_variant);

    /* Static CDMA Properties */
    property_set("ril.subscription.types", "NV,RUIM");
    property_set("ro.telephony.default_cdma_sub", "0");
    property_set("telephony.lteOnCdmaDevice", "1");
}

void gsm_properties(char const *rild_lib_variant)
{
    set_rild_libpath(rild_lib_variant);

    property_set("ro.telephony.default_network", "9");
    property_set("telephony.lteOnGsmDevice", "1");
}

void vendor_load_properties()
{
    const std::string bootloader = GetProperty("ro.bootloader", "");

    const auto set_ro_product_prop = [](const std::string &source,
            const std::string &prop, const std::string &value) {
        auto prop_name = "ro.product." + source + prop;
        property_override(prop_name.c_str(), value.c_str(), false);
    };

    if (bootloader.find("A500FU") == 0) {
        /* SM-A500FU */
        for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/a5ultexx/a5ulte:6.0.1/MMB29M/A500FUXXU1CRH1:user/release-keys");     
            set_ro_product_prop(source, "model", "SM-A500FU");
            set_ro_product_prop(source, "device", "a5ulte");
        }
        property_override("ro.build.description", "a5ultexx-user 6.0.1 MMB29M A500FUXXU1CRH1 release-keys");
	gsm_properties("gsm");
    } else if (bootloader.find("A500F") == 0) {
        /* SM-A500F */
	for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/a5ltexx/a5lte:6.0.1/MMB29M/A500FXXU1CRH2:user/release-keys");    
            set_ro_product_prop(source, "model", "SM-A500F");
            set_ro_product_prop(source, "device", "a5lte");
	}
        property_override("ro.build.description", "a5ltexx-user 6.0.1 MMB29M A500FXXU1CRH2 release-keys");
	gsm_properties("gsm");
    } else if (bootloader.find("A500G") == 0) {
        /* SM-A500G */
	for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/a5ltedd/a5lte:6.0.1/MMB29M/A500GXXS1CRJ1:user/release-keys");    
            set_ro_product_prop(source, "model", "SM-A500G");
            set_ro_product_prop(source, "device", "a5lte");
	}
        property_override("ro.build.description", "a5ltedd-user 6.0.1 MMB29M A500GXXS1CRJ1 release-keys");
	gsm_properties("gsm");
    } else if (bootloader.find("A500M") == 0) {
        /* SM-A500M */
	for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/a5lteub/a5lte:6.0.1/MMB29M/A500MUBS1CRI1:user/release-keys"); 
            set_ro_product_prop(source, "model", "SM-A500M");
            set_ro_product_prop(source, "device", "a5lte");
	}
        property_override("ro.build.description", "a5lteub-user 6.0.1 MMB29M A500MUBS1CRI1 release-keys");
	gsm_properties("gsm");
    } else if (bootloader.find("A500L") == 0) {
        /* SM-A500L */
	for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/a5ultelgt/a5ultelgt:6.0.1/MMB29M/A500LKLU1CQC1:user/release-keys");
            set_ro_product_prop(source, "model", "SM-A500L");
            set_ro_product_prop(source, "device", "a5ulte");
	}
        property_override("ro.build.description", "a5ultelgt-user 6.0.1 MMB29M A500LKLU1CQC1 release-keys");
	gsm_properties("gsm");
    } else if (bootloader.find("A500H") == 0) {
        /* SM-A500H */
	for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/a53gxx/a53g:6.0.1/MMB29M/A500HXXS1CQC5:user/release-keys");  
            set_ro_product_prop(source, "model", "SM-A500H");
            set_ro_product_prop(source, "device", "a53g");
	}
        property_override("ro.build.description", "a53gxx-user 6.0.1 MMB29M A500HXXS1CQC5 release-keys");
	gsm_properties("gsm");
    } else if (bootloader.find("A500Y") == 0) {
        /* SM-A500Y */
	for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/a5ultedv/a5ulte:6.0.1/MMB29M/A500YDVS1CRJ1:user/release-keys");
            set_ro_product_prop(source, "model", "SM-A500Y");
            set_ro_product_prop(source, "device", "a5ulte");
	}
        property_override("ro.build.description", "a5ultedv-user 6.0.1 MMB29M A500YDVS1CRJ1 release-keys");
	gsm_properties("gsm");
    } else if (bootloader.find("A500F1") == 0) {
        /* SM-A500F1 */
	for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/a5ultekx/a5ulteskt:6.0.1/MMB29M/A500F1U1CQB1:user/release-keys");    
            set_ro_product_prop(source, "model", "SM-A500F1");
            set_ro_product_prop(source, "device", "a5ulteskt");
	}
        property_override("ro.build.description", "a5ultekx-user 6.0.1 MMB29M A500F1U1CQB1 release-keys");
	gsm_properties("gsm");
    } else if (bootloader.find("A500S") == 0) {
        /* SM-A500S */
	for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/a5ulteskt/a5ulteskt:6.0.1/MMB29M/A500SKSU1CQB1:user/release-keys");
            set_ro_product_prop(source, "model", "SM-A500S");
            set_ro_product_prop(source, "device", "a5ulteskt");
	}
        property_override("ro.build.description", "a5ulteskt-user 6.0.1 MMB29M A500SKSU1CQB1 release-keys");
	gsm_properties("gsm");
    } else if (bootloader.find("A500K") == 0) {
        /* SM-A500K */
	for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/a5ultektt/a5ultektt:6.0.1/MMB29M/A500KKTU1CQB1:user/release-keys");
            set_ro_product_prop(source, "model", "SM-A500K");
            set_ro_product_prop(source, "device", "a5ultektt");
	}
        property_override("ro.build.description", "a5ultektt-user 6.0.1 MMB29M A500KKTU1CQB1 release-keys");
	gsm_properties("gsm");
    } else if (bootloader.find("A500W") == 0) {
        /* SM-A500W */
	for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/a5ultebmc/a5ultebmc:6.0.1/MMB29M/A500WVLS1BPK2:user/release-keys");
            set_ro_product_prop(source, "model", "SM-A500W");
            set_ro_product_prop(source, "device", "a5ultebmc");
	}
        property_override("ro.build.description", "a5ultebmc-user 6.0.1 MMB29M A500WVLS1BPK2 release-keys");
	gsm_properties("gsm");
    } else if (bootloader.find("A500YZ") == 0) {
        /* SM-A500YZ */
	for (const auto &source : ro_product_props_default_source_order) {
            set_ro_product_prop(source, "fingerprint", "samsung/a5ltezt/a5ltezt:5.0.2/LRX22G/A500YZZTU1BOK2:user/release-keys"); 
            set_ro_product_prop(source, "model", "SM-A500YZ");
            set_ro_product_prop(source, "device", "a5ltezt");
        }
        property_override("ro.build.description", "a5ltezt-user 5.0.2 LRX22G A500YZZTU1BOK2 release-keys");
    } else {
        gsm_properties("gsm");
    }

    const std::string device = GetProperty("ro.product.device", "");
    LOG(INFO) << "Found bootloader " << bootloader << ". " << "Setting build properties for " << device << ".\n";
}
