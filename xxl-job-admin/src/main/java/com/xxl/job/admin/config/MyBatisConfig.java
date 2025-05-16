package com.xxl.job.admin.config;

import org.apache.ibatis.mapping.DatabaseIdProvider;
import org.apache.ibatis.mapping.VendorDatabaseIdProvider;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Properties;

@Configuration
public class MyBatisConfig {
    @Bean
    public DatabaseIdProvider databaseIdProvider() {
        VendorDatabaseIdProvider databaseIdProvider = new VendorDatabaseIdProvider();
        Properties properties = new Properties();
        properties.setProperty("MySQL", "mysql");
        properties.setProperty("PostgreSQL", "postgresql");
        properties.setProperty("Oracle", "oracle");
        properties.setProperty("SQL Server", "sqlserver");
        properties.setProperty("OceanBase", "oceanbase");
        databaseIdProvider.setProperties(properties);
        return databaseIdProvider;
    }
}
